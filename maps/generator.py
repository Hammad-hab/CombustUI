"""
A tiny script that takes a .map.gen and converts it to ffi bindings
"""
import json as j
import copy
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
        except:
            print('Error: Given file isn\'t a proper FFI map')
            sys.exit(1)
        
        definations = []
        bindings = []
        new_parsed_contents = copy.deepcopy(parsed_contents)
        for key, value in parsed_contents.items():
            
            if key.startswith("@"):
                if key == '@includes': 
                    for file in value:
                        with open(file) as f:
                            parsed_import = j.loads(f.read())
                            new_parsed_contents.update(parsed_import)
                            
                if key == '@concat_variations': 
                    kvpair = value
                    target = kvpair['target']
                    target_def = parsed_contents[target]
                    for varation in kvpair['variations']:
                        if '@cbindto' in target_def.keys():
                            target_def['@cbindto'] = target_def['@cbindto']+varation
                        new_parsed_contents[target+varation] = target_def
                    new_parsed_contents[target] = None
                    
        for key, value in new_parsed_contents.items():
            if key.startswith("@") or not value:
                continue
            if '@redef' in value.keys():
                value = new_parsed_contents[value['@redef']]
                
            args = [f"{arg_name}: {dtype}" for arg_name, dtype in value['arguments'].items()]
            args_str = ', '.join(args)
            defination = f'{key.upper()}_DEFINATION'
            defination_alias = (f'alias {defination}= fn({args_str}) -> {value['returns']}')
            function_binding = (f'var {key} = __dll.get_function[{defination}]("{key if '@cbindto' not in value.keys() else value['@cbindto']}")')
            bindings.append(function_binding)
            definations.append(defination_alias)
            
        with open(OutputDir + 'bindings.mojo', 'w') as f:
            f.write(f'"""Auto generated using generator.py"""\n\n\nfrom .dll import __dll\nfrom ..types import *\n\n{"\n".join(definations)}\n\n{"\n".join(bindings)}')