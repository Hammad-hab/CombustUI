"""
A tiny script that takes a .map.gen and converts it to ffi bindings
"""
import json as j
import sys

File = sys.argv[1] if sys.argv.__len__() > 0 else None
OutputDir = sys.argv[2] if sys.argv.__len__() > 0 else None
if File:
    if not File.endswith('map.gen'):
        print('Error: Given file isn\'t an FFI map')
        sys.exit(1)
    
    with open(File, 'r') as f:
        raw_contents = f.read()
        try:
            parsed_contents: dict[str, dict] = j.loads(raw_contents)
            print(parsed_contents)
        except:
            print('Error: Given file isn\'t a proper FFI map')
            sys.exit(1)
        
        definations = []
        bindings = []
        
        for key, value in parsed_contents.items():
            if key.startswith("@"):
                continue
            if '@redef' in value.keys():
                value = parsed_contents[value['@redef']]
            args = [f"{arg_name}: {dtype}" for arg_name, dtype in value['arguments'].items()]
            args_str = ', '.join(args)
            defination = f'{key.upper()}_DEFINATION'
            defination_alias = (f'alias {defination}= fn({args_str}) -> {value['returns']}')
            function_binding = (f'var {key} = __dll.get_function[{defination}]("{key if '@cbindto' not in value.keys() else value['@cbindto']}")')
            bindings.append(function_binding)
            definations.append(defination_alias)
            
        with open(OutputDir + 'bindings.mojo', 'w') as f:
            f.write(f'"""Auto generated using generator.py"""\n\n\nfrom .dll import __dll\nfrom .function_definations import *\nfrom ..types import *\n\n{"\n".join(definations)}\n\n{"\n".join(bindings)}')