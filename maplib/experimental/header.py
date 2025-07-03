"""
    A new method for generating bindings. 
    Reads the header files of the bindings and automatically
    generates static mojo bindings.
"""
import subprocess
import glob
import json
from time import time

# Extracts the function name and return type from a function declaration line
def get_name_ret_type(function: str):
    namepret = function.split(" ")  # split the line by spaces
    argstart = namepret[1].index('(')  # find '(' to separate name from parameters
    ret = namepret[0].strip()  # first part is the return type
    
    # Map C return types to your target types
    if ret == 'void':
        ret = 'c_void'
    elif 'int' in ret:
        ret = 'Int'
    elif "*" in ret:
        if "Fl_Image" in ret:
            ret = 'Int32'
        else:
            ret = 'FLTK_WIDGET_POINTER'
    
    return namepret[1][:argstart], ret  # return (function_name, return_type)

# Parses the arguments inside a function declaration and maps them to mojo types
def get_args(function: str):
    argstart = function.index("(") + 1
    argsend = function.index(")")
    args = function[argstart:argsend]
    args = args.split(',')
    args = [arg.strip().split(' ') for arg in args]  # split into [type, name]
    
    mojo_args = {}
    for arg in args:
        if len(arg) == 3:
            # Handle multi-word types like 'long int' or 'const char*'
            if arg[0] == 'long' and arg[1] == 'int':
                mojo_args[arg[-1]] = 'Int32'
                continue
            if arg[0] == 'const' and arg[1] == 'char*':
                mojo_args[arg[-1]] = 'StringBytes'
                continue
        
        if len(arg) == 2:
            # Handle common C types
            if arg[0] == 'Fl_Color':
                mojo_args[arg[-1].replace("*", '')] = 'UInt32'
                continue
            
            if arg[0] == 'RESIZE' or arg[0] == 'Fl_Boxtype':
                mojo_args[arg[-1].replace("*", '')] = 'Int'
                continue
            
            if arg[0] == 'int':
                mojo_args[arg[-1].replace("*", '')] = 'Int'
                continue
            
            if 'int8_t' in arg[0]: 
                mojo_args[arg[-1].replace("*", '')] = 'StringBytes'
                continue
            
            # Handle pointer or widget types
            if 'Fl_Image' not in arg[0] and ("Fl" in arg[0] or "MJUI" in arg[0]):
                mojo_args[arg[-1].replace("*", '')] = 'FLTK_WIDGET_POINTER'
                continue
            elif 'Fl_Image' in arg[0]:
                mojo_args[arg[-1].replace("*", '')] = 'Int32'
                continue
    
    return mojo_args

# Builds the function map entry (name -> {returns, arguments})
def generate_function_map(function: str, id) -> dict:
    print(f'\033[104;97mDECLFILE ({id})\033[0m', function)  # Print highlighted declaration
    name, rettype = get_name_ret_type(function)
    args = get_args(function)
    map = {
        name: {
            "returns": rettype,
            "arguments": args
        }
    }
    return map

# Processes one header file: reads lines after #define FFI, generates maps for each function
def evaluate(header, id):
    maps = []
    with open(header) as h:
        content = h.read()
        if len(content.strip()) == 0:
            return None  # skip empty files
        start = content.index('#define FFI')  # find start of FFI functions
        fns = content[start:].splitlines()
        # Filter out non-function lines (like empty lines or macro comments)
        fns = [fn for fn in fns if len(fn) > 0 and not fn.startswith('#')]
        for fn in fns:
            map = generate_function_map(fn, id)
            maps.append(map)
    return maps

# === MAIN SCRIPT STARTS ===
t0 = time()
# Use glob to list all .hh files recursively
files = glob.glob('*/**/*.hh', recursive=True)

# Use subprocess 'ls' on these files for uniform filtering (if needed by your system)
res = subprocess.run(['ls'] + files, capture_output=True)
header_files = (res.stdout).decode('utf-8').splitlines()

ffi_map = {}

# Build the entire FFI map by iterating through each header
for file in header_files:
    id = header_files.index(file)
    map_list = evaluate(file, id)
    if map_list is None:
        continue
    for instance in map_list:
        for key, value in instance.items():
            ffi_map[key] = value

# Write final JSON output to a file
stringified = json.dumps(ffi_map, indent=2)
with open('ffi.map.gen', "w") as f:
    f.write(stringified)

# Print summary
t1 = time()
print('Total Functions Bound:', len(ffi_map.keys()))
print('Time:', t1-t0, 's', end='\n\n')