APP_NAME="new_combust_ui_App"
echo "Enter App Name:"
read APP_NAME
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