"""
    A new method for generating bindings. Reads the header files of the bindings and automatically
    generates static mojo bindings.
"""
import subprocess
import glob
import json

def get_name_ret_type(function: str):
    namepret = function.split(" ") # split at gaps
    argstart = namepret[1].index('(')
    ret = namepret[0].strip()
    
    if ret == 'void':
        ret = 'c_void'
    elif 'int' in ret:
        ret = 'Int'
    elif "*" in ret:
        if "Fl_Image" in ret:
            ret = 'Int32'
        else:
            ret = 'FLTK_WIDGET_POINTER'
    
    return namepret[1][:argstart], ret # first substring is return type

def get_args(function: str):
    argstart = function.index("(") + 1 # ignore the (
    argsend = function.index(")")
    args = function[argstart:argsend]
    args = args.split(',')
    args = [arg.strip().split(' ') for arg in args]
    mojo_args = {}
    for arg in args:
        if len(arg) == 3:
            if arg[0] == 'long' and arg[1] == 'int':
                mojo_args[arg[-1]] = 'Int32'
                continue
            if arg[0] == 'const' and arg[1] == 'char*':
                mojo_args[arg[-1]] = 'StringBytes'
                continue
            
        if len(arg) == 2:
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
            
            if 'Fl_Image' not in arg[0] and "Fl" in arg[0] or "MJUI" in arg[0]: # we have a pointer, and the only pointer in combustui, is FLTK_WIDGET_POINTER
                mojo_args[arg[-1].replace("*", '')] = 'FLTK_WIDGET_POINTER'
                continue
            elif 'Fl_Image' in arg[0]:
                mojo_args[arg[-1].replace("*", '')] = 'Int32'
                continue
    return mojo_args

def generate_function_map(function: str) -> dict:
    print('\033[104;97mDECL\033[0m', function)
    name, rettype = get_name_ret_type(function)
    args = get_args(function)
    map = {
        name: {
            "returns": rettype,
            "arguments": args
        }
    }
    return map

def evaluate(header):
    maps = []
    with open(header) as h:
        content = h.read()
        if len(content.strip()) == 0:
            return None
        start = content.index('#define FFI')        
        fns = content[start:].splitlines()
        fns = [fn for fn in fns if len(fn) > 0 and not fn.startswith('#')]
        for fn in fns:
            map = generate_function_map(fn)
            maps.append(map)
    
    return maps
                    
files = glob.glob('*/**/*.hh', recursive=True)
res = subprocess.run(['ls'] + files, capture_output=True) # select all header files
header_files = (res.stdout).decode('utf-8').splitlines()

ffi_map = {}

for file in header_files:
    map_list = evaluate(file)
    for instance in map_list:
        for key, value in instance.items():
            ffi_map[key] = value


stringified = json.dumps(ffi_map)
with open('ffi.map.gen', "+x") as f:
    f.write(stringified)