set -e

cd mjui/fltk_bindings/libc/
echo "Compiling mjui-fltk bindings..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      g++ -shared -fPIC -Wc++11-extensions ./main.cc -o ./out/mjui.so -I./ `fltk-config --cxxflags --ldflags --libs` -std=c++11 -lfltk_images -ljpeg
elif [[ "$OSTYPE" == "darwin"* ]]; then
      g++ -shared -Wc++11-extensions ./main.cc -o ./out/mjui.dylib -I./ `fltk-config --cxxflags --ldflags --libs --use-cairo` `pkg-config --cflags --libs cairo` -std=c++11 -lfltk_images
fi 

cd ../../../
echo "Successfully compiled"
echo "Generating Bindings..."

rm ./maplib/ffi.map.gen
python3 ./maplib/experimental/header.py
mv ./ffi.map.gen ./maplib/ffi.map.gen

cd ./maplib
python3 generator.py ./ffi.map.gen ../mjui/fltk_bindings/
cmd=`which realpath`
fnd=`which find`

cd ../
if [ -z "$COMBUSTUI_DLL_PATH" ]; then
   if [[ "$OSTYPE" == "linux-gnu"* ]]; then
         echo "export COMBUSTUI_DLL_PATH=\"$(pwd)/mjui/fltk_bindings/libc/out/mjui.so\"" >> ~/.zshrc
   elif [[ "$OSTYPE" == "darwin"* ]]; then
         echo "export COMBUSTUI_DLL_PATH=\"$(pwd)/mjui/fltk_bindings/libc/out/mjui.dylib\"" >> ~/.zshrc
   fi 
   echo "Added COMBUSTUI_DLL_PATH to your ~/.zshrc. Run 'source ~/.zshrc' or open a new terminal to use it."
fi

echo "Successfully generating bindings..."
mojo run --disable-warnings app.mojo # TODO Remove --disable-warnings and properly upgrade to 25.4