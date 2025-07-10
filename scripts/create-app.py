import sys
import os
import subprocess
import shutil
from pathlib import Path

if sys.platform == 'darwin':
    # Check for brew
    homebrew = subprocess.run(['which', 'brew'], capture_output=True, text=True)
    if homebrew.returncode != 0:
        raise SystemError('Homebrew not installed. Install Homebrew and try again')

    # Install FLTK (always try, brew is idempotent)
    print("Installing FLTK...")
    subprocess.run(['brew', 'install', 'fltk'])

    # Clone repo
    subprocess.run(['git', 'clone', 'https://github.com/Hammad-hab/CombustUI.git'])
    user = subprocess.run(['git', 'config', 'user.name'], capture_output=True, text=True)
    email = subprocess.run(['git', 'config', 'user.email'], capture_output=True, text=True)

    # App setup
    app_name = input('Enter App Name: ')
    app_description = input('Enter App Description: ')
    os.mkdir(app_name)

    # Move files
    for item in os.listdir('./CombustUI'):
        shutil.move(os.path.join('./CombustUI', item), f'./{app_name}')
    os.rmdir('./CombustUI')

    # Change directory
    os.chdir(f'./{app_name}')

    # Setup environment variable
    dll_path = str(Path.cwd() / 'mjui/fltk_bindings/libc/out/mjui.dylib')
    print('Editing environment variables...')
    zshrc = os.path.expanduser('~/.zshrc')
    with open(zshrc, 'a') as f:
        f.write(f'\nexport COMBUSTUI_DLL_PATH="{dll_path}"\n')
    print(f"Added COMBUSTUI_DLL_PATH to {zshrc}.")
    os.system('source ~/.zshrc')

    # Clean up files
    for pattern in ('*.png', '*.jpeg', '*.md', 'CHANGELOG', 'LICENSE'):
        for file in Path('.').glob(pattern):
            file.unlink(missing_ok=True)

    with open('app.mojo', '+x') as f:
        f.write
    # Start shell
    os.system('magic shell')

elif sys.platform.startswith('linux'):
    print('Linux support TODO')
elif 'win' in sys.platform:
    print('Windows not supported')
