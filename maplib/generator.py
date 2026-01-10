"""
A tiny script that takes a .map.gen and converts it to ffi bindings
and wraps them inside a struct/class context
"""

import json as j
import sys
from pathlib import Path

# === READ COMMAND LINE ARGUMENTS ===
File = sys.argv[1] if len(sys.argv) > 1 else None
OutputDir = sys.argv[2] if len(sys.argv) > 2 else None

if File:
    if not File.endswith('map.gen'):
        print("Error: Given file isn't an FFI map")
        sys.exit(1)

    with open(File, 'r') as f:
        raw_contents = f.read()
        try:
            parsed_contents: dict[str, dict] = j.loads(raw_contents)
        except:
            print("Error: Given file isn't a proper FFI map")
            sys.exit(1)

        # Prepare lists for type aliases
        definitions = []

        # Prepare struct fields and __init__ assignments
        struct_fields = []
        init_assignments = []

        for key, value in parsed_contents.items():
            if key == "?":
                continue

            args = [f"{arg_name}: {dtype}" for arg_name, dtype in value["arguments"].items()]
            args_str = ", ".join(args)

            # Type alias
            definition_name = f"{key.upper()}_DEFINATION"
            definitions.append(f"alias {definition_name}= fn({args_str}) -> {value['returns']}")

            # Struct field name (same as original function name)
            struct_fields.append(f"    var {key.replace('mjui', '')}: {definition_name}")

            # Init assignment
            func_name = key if "@cbindto" not in value else value["@cbindto"]
            init_assignments.append(
                f"        self.{key.replace('mjui', '')} = __dll.get_function[{definition_name}](\"{func_name}\")"
            )

        # Join everything
        joined_definitions = "\n".join(definitions)
        joined_fields = "\n".join(struct_fields)
        joined_inits = "\n".join(init_assignments)

        # Ensure output directory exists
        Path(OutputDir).parent.mkdir(parents=True, exist_ok=True)

        # Write to output
        with open(Path(OutputDir) / "bindings.mojo", 'w') as f:
            f.write(
f'''"""Auto generated using maplib"""

from .dll import init
from ..types import *

{joined_definitions}


struct CombustUIContext:
{joined_fields}

    def __init__(out self):
        var __dll = init()

{joined_inits}
'''
            )

    print(f"Bindings successfully written to {OutputDir}/bindings.mojo")
else:
    print("Usage: python map_to_ffi.py <input.map.gen> <output_dir>")
