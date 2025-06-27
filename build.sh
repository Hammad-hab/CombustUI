cd mjui/fltk_bindings/libc/
echo "Compiling mjui-fltk bindings..."
g++ -shared -Wc++11-extensions ./main.cc -o ./out/mjui.dylib -I./ `fltk-config --cxxflags --ldflags --libs --use-cairo` `pkg-config --cflags --libs cairo` -std=c++11 -lfltk_images 
cd ../../../
echo "Successfully compiled"
echo "Generating Bindings..."

cd ./maps
python3 generator.py ./ffi.map.gen ../mjui/fltk_bindings/
cmd=`which realpath`
fnd=`which find`
export COMBUSTUI_DLL_PATH="/Users/hammad/Documents/Hammad/Mojo/CombustUI-Mojo/mjui/fltk_bindings/libc/out/mjui.dylib"
cd ../

echo "Successfully generating bindings..."
mojo run --disable-warnings app.mojo 
