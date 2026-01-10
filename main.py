from gi.repository import GIRepository

t

def get_type_string(type_info):
    """Convert a TypeInfo to a readable string"""
    tag = type_info.get_tag()
  
    if tag == GIRepository.TypeTag.VOID:
        return "void"
    elif tag == GIRepository.TypeTag.BOOLEAN:
        return "boolean"
    elif tag == GIRepository.TypeTag.INT8:
        return "int8"
    elif tag == GIRepository.TypeTag.UINT8:
        return "uint8"
    elif tag == GIRepository.TypeTag.INT16:
        return "int16"
    elif tag == GIRepository.TypeTag.UINT16:
        return "uint16"
    elif tag == GIRepository.TypeTag.INT32:
        return "int32"
    elif tag == GIRepository.TypeTag.UINT32:
        return "uint32"
    elif tag == GIRepository.TypeTag.INT64:
        return "int64"
    elif tag == GIRepository.TypeTag.UINT64:
        return "uint64"
    elif tag == GIRepository.TypeTag.FLOAT:
        return "float"
    elif tag == GIRepository.TypeTag.DOUBLE:
        return "double"
    elif tag == GIRepository.TypeTag.UTF8:
        return "char*"
    elif tag == GIRepository.TypeTag.FILENAME:
        return "filename"
    elif tag == GIRepository.TypeTag.ARRAY:
        array_type = type_info.get_array_type()
        param_type = type_info.get_param_type(array_type)
        return f"{get_type_string(param_type)}[]"
    elif tag == GIRepository.TypeTag.INTERFACE:
        # interface = type_info.get_interface()
        # return interface.get_name()
        return "GTKInterface"
    elif tag == GIRepository.TypeTag.GLIST:
        # param_type = type_info.get_param_type(0)
        return f"GTKType"
    elif tag == GIRepository.TypeTag.GTYPE:
        # param_type = type_info.get_param_type(0)
        return f"GTKType"
    elif tag == GIRepository.TypeTag.GSLIST:
        # param_type = type_info.get_param_type(0)
        return f"GTKType"
    elif tag == GIRepository.TypeTag.GHASH:
        return "GTKType"
    elif tag == GIRepository.TypeTag.ERROR:
        return "GError**"
    else:
        return str(tag)

def format_function_signature(func_info, class_name=None):
    """Format a complete function signature"""
    func_name = func_info.get_name()
    symbol = func_info.get_symbol()
    
    # Get return type
    # print(dir(func_info))
    # print(dir())
    # exit()
    return_type_info = func_info.get_return_type()
    return_type = get_type_string(return_type_info)
    
    # Get parameters
    n_args = func_info.get_n_args()
    params = []
    
    for i in range(n_args):
        arg = func_info.get_arg(i)
        arg_name = arg.get_name()
        arg_info = arg.get_type_info()
        arg_type = get_type_string(arg_info)
        
        # Check direction
        direction = arg.get_direction()
        if direction == GIRepository.Direction.OUT:
            arg_type += "*"
        elif direction == GIRepository.Direction.INOUT:
            arg_type += "*"
        
        params.append(f"{arg_type} {arg_name}")
    
    params_str = ", ".join(params) if params else "void"
    
    # Format the signature
    if class_name:
        signature = f"{return_type} {symbol}({params_str})"
    else:
        signature = f"{return_type} {symbol}({params_str})"
    
    return signature, symbol

def extract_all_gtk_functions():
    repo = GIRepository.Repository()
    
    try:
        repo.require('cairo', '1.0', 0)
        repo.require('Gtk', '4.0', 0)
        
        n_infos = repo.get_n_infos('Gtk')
        
        all_functions = []
        stats = {
            'top_level_functions': 0,
            'object_methods': 0,
            'object_constructors': 0,
            'interface_methods': 0,
            'struct_methods': 0,
            'union_methods': 0,
            'callbacks': 0,
            'virtual_methods': 0,
            'static_methods': 0
        }
        
        print("=== Extracting ALL GTK 4.0 Functions with Signatures ===\n")
        
        for i in range(n_infos):
            info = repo.get_info('Gtk', i)
            info_name = info.get_name()
            
            # 1. Top-level functions
            if isinstance(info, GIRepository.FunctionInfo):
                signature, symbol = format_function_signature(info)
                all_functions.append(f"{signature}\n")
                stats['top_level_functions'] += 1
            
            # 2. Object/Class methods and constructors
            elif isinstance(info, GIRepository.ObjectInfo):
                # Instance methods
                n_methods = info.get_n_methods()
                for j in range(n_methods):
                    method = info.get_method(j)
                    signature, symbol = format_function_signature(method, info_name)
                    
                    flags = method.get_flags()
                    if flags & GIRepository.FunctionInfoFlags.IS_METHOD:
                        all_functions.append(f"{signature}\n")
                        stats['object_methods'] += 1
                    else:
                        all_functions.append(f"{signature}\n")
                        stats['static_methods'] += 1
                
                # Constructors
                try:
                    n_constructors = info.get_n_constructors()
                    for j in range(n_constructors):
                        constructor = info.get_constructor(j)
                        signature, symbol = format_function_signature(constructor, f"{info_name}::new")
                        all_functions.append(f"{signature}\n")
                        stats['object_constructors'] += 1
                except:
                    pass
                
                # Virtual methods (vfuncs)
                try:
                    n_vfuncs = info.get_n_vfuncs()
                    for j in range(n_vfuncs):
                        vfunc = info.get_vfunc(j)
                        try:
                            signature, symbol = format_function_signature(vfunc, f"{info_name}::vfunc")
                            all_functions.append(f"{signature}\n")
                            stats['virtual_methods'] += 1
                        except:
                            pass
                except:
                    pass
            
            # 3. Interface methods
            elif isinstance(info, GIRepository.InterfaceInfo):
                n_methods = info.get_n_methods()
                for j in range(n_methods):
                    method = info.get_method(j)
                    signature, symbol = format_function_signature(method, info_name)
                    all_functions.append(f"{signature}\n")
                    stats['interface_methods'] += 1
                
                # Virtual methods in interfaces
                try:
                    n_vfuncs = info.get_n_vfuncs()
                    for j in range(n_vfuncs):
                        vfunc = info.get_vfunc(j)
                        try:
                            signature, symbol = format_function_signature(vfunc, f"{info_name}::vfunc")
                            all_functions.append(f"{signature}\n")
                            stats['virtual_methods'] += 1
                        except:
                            pass
                except:
                    pass
            
            # 4. Struct methods
            elif isinstance(info, GIRepository.StructInfo):
                n_methods = info.get_n_methods()
                for j in range(n_methods):
                    method = info.get_method(j)
                    signature, symbol = format_function_signature(method, info_name)
                    all_functions.append(f"{signature}\n")
                    stats['struct_methods'] += 1
            
            # 5. Union methods
            elif isinstance(info, GIRepository.UnionInfo):
                n_methods = info.get_n_methods()
                for j in range(n_methods):
                    method = info.get_method(j)
                    signature, symbol = format_function_signature(method, info_name)
                    all_functions.append(f"{signature}\n")
                    stats['union_methods'] += 1
            
            # 6. Callback signatures
            elif isinstance(info, GIRepository.CallbackInfo):
                try:
                    signature, _ = format_function_signature(info, "Callback")
                    all_functions.append(f"{signature}\n  (Function pointer type)\n")
                    stats['callbacks'] += 1
                except:
                    all_functions.append(f"{info_name} (function pointer type)\n")
                    stats['callbacks'] += 1
            
            # Show progress
            if (i + 1) % 50 == 0:
                print(f"Processed {i + 1}/{n_infos} items... Found {len(all_functions)} functions so far")
        
        # Write to file
        with open('fn.txt', 'w') as f:
            for func in all_functions:
                f.write(func)
        
        print(f"\n✓ Extracted {len(all_functions)} total functions to fn.txt")
        print("\n=== Statistics ===")
        for key, value in stats.items():
            if value > 0:
                print(f"  {key.replace('_', ' ').title()}: {value}")
                
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    extract_all_gtk_functions()