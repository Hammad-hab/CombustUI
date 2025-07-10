import sys
import os
import subprocess
import shutil
from pathlib import Path

get_started = 'https://raw.githubusercontent.com/Hammad-hab/CombustUI/refs/heads/main/scripts/get_started.mojo'
build_fltk = 'https://raw.githubusercontent.com/Hammad-hab/CombustUI/refs/heads/main/scripts/build_fltk1.4.sh'

OUT_FILE = 'app.mojo'

def install_linux_dependencies():
    # Try to detect package manager
    subprocess.run(['curl', build_fltk, '-o', './build_fltk1.4.sh'])
    os.chmod("./build_fltk.sh", "+x")
    process = subprocess.run(['./build_fltk1.4.sh'])
    if process.returncode != 0:
        raise SystemError(f'build_fltk failed with error code {process.returncode}')

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
    try:
        os.rmdir('./scripts')
        os.rmdir('./examples')
    except:
        print('Failed to remove scripts and examples')

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

    subprocess.run(['curl', get_started, '-o', OUT_FILE])
    # Start shell   
    os.system('magic shell')

elif sys.platform.startswith('linux'):
    install_linux_dependencies()
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
    try:
        os.rmdir('./scripts')
        os.rmdir('./examples')
    except:
        print('Failed to remove scripts and examples')
    # Setup environment variable in bashrc or zshrc
    dll_path = str(Path.cwd() / 'mjui/fltk_bindings/libc/out/mjui.so')
    bashrc = os.path.expanduser('~/.bashrc')
    zshrc = os.path.expanduser('~/.zshrc')

    if os.path.exists(zshrc):
        rc_file = zshrc
    else:
        rc_file = bashrc

    print('Editing environment variables...')
    with open(rc_file, 'a') as f:
        f.write(f'\nexport COMBUSTUI_DLL_PATH="{dll_path}"\n')
    print(f"Added COMBUSTUI_DLL_PATH to {rc_file}.")
    os.system(f'source {rc_file}')

    # Clean up files
    for pattern in ('*.png', '*.jpeg', '*.md', 'CHANGELOG', 'LICENSE'):
        for file in Path('.').glob(pattern):
            file.unlink(missing_ok=True)

    subprocess.run(['curl', get_started, '-o', OUT_FILE])
    # Start shell
    os.system('magic shell')

elif 'win' in sys.platform:
    print('Windows not supported')
