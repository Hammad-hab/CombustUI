echo "Welcome to IgniteApp--let's put your app on fire 🔥"
APP_NAME="new_combust_ui_App"
USER="$(git config user.name) <$(git config user.email)>"
echo "Enter App Name:"
read APP_NAME

echo "Enter App Description"
read APP_DESC

echo "Creating new app \"$APP_NAME\"..."
mkdir $APP_NAME
git clone https://github.com/Hammad-hab/CombustUI.git
mv ./CombustUI/* ./$APP_NAME
rm -rf ./CombustUI
cd $APP_NAME
mkdir assets
touch app.🔥
rm ./build.sh
cd ./mjui/fltk_bindings/
DIR="$(pwd)"
echo "Altering DLL path"
echo "from sys.ffi import DLHandle, UnsafePointer\nvar __dll = DLHandle('$DIR/mjui/fltk_bindings/libc/out/fltk.dylib')" > dll.mojo
cd libc
echo "Removing C++ files.."
rm *.cc
cd ../../../
echo "[project]
authors = [\"$USER\"]
channels = [\"conda-forge\", \"https://conda.modular.com/max\", \"https://repo.prefix.dev/modular-community\"]
description = \"$APP_DESC\"
name = "$APP_NAME"
platforms = [\"osx-arm64\"]
version = \"0.1.0\"

[tasks]

[dependencies]
max = \">=24.6.0,<25\"
" > mojoproject.toml