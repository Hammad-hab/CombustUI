"""
A tiny script that takes a .map.gen and converts it to ffi bindings
"""

import json as j  # Import JSON module with alias `j`
import copy
import sys

# === READ COMMAND LINE ARGUMENTS ===
# Get input map file (.map.gen) from first argument if exists
File = sys.argv[1] if sys.argv.__len__() > 0 else None
# Get output directory from second argument if exists
OutputDir = sys.argv[2] if sys.argv.__len__() > 0 else None

# === PROCESS THE MAP FILE ===
if File:
    # Ensure the provided file ends with `.map.gen` to validate format
    if not File.endswith('map.gen'):
        print('Error: Given file isn\'t an FFI map')
        sys.exit(1)
    
    # === PARSE THE JSON MAP FILE ===
    with open(File, 'r') as f:
        raw_contents = f.read()
        try:
            parsed_contents: dict[str, dict] = j.loads(raw_contents)
        except:
            print('Error: Given file isn\'t a proper FFI map')
            sys.exit(1)
        
        # === PREPARE OUTPUT ===
        definations = []  # to hold alias definitions (function signatures)
        bindings = []     # to hold actual ffi function binding lines
                    
        # === LOOP OVER EACH FUNCTION IN THE MAP ===
        for key, value in parsed_contents.items():

            # Build the argument list as `name: Type`
            args = [f"{arg_name}: {dtype}" for arg_name, dtype in value['arguments'].items()]
            args_str = ', '.join(args)

            # Generate the function type alias
            defination = f'{key.upper()}_DEFINATION'
            defination_alias = (
                f'alias {defination}= fn({args_str}) -> {value["returns"]}'
            )

            # Generate the binding line, using @cbindto override if present
            function_binding = (
                f'var {key} = __dll.get_function[{defination}]('
                f'"{key if "@cbindto" not in value.keys() else value["@cbindto"]}")'
            )

            # Append to lists
            bindings.append(function_binding)
            definations.append(defination_alias)
            
        # === WRITE THE GENERATED BINDINGS TO OUTPUT FILE ===
        with open(OutputDir + 'bindings.mojo', 'w') as f:
            f.write(
                f'"""Auto generated using maplib"""\n\n\n'
                f'from .dll import __dll\n'
                f'from ..types import *\n\n'
                f'{"\n".join(definations)}\n\n'
                f'{"\n".join(bindings)}'
            )
