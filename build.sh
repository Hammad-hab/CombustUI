cd mjui/fltk_bindings/libc/
echo "Compiling mjui-fltk bindings..."
g++ -shared -Wc++11-extensions ./main.cc -o ./out/mjui.dylib -I./ `fltk-config --cxxflags --ldflags --libs --use-cairo` `pkg-config --cflags --libs cairo` -std=c++11 -lfltk_images 
cd ../../../
echo "Successfully compiled"
echo "Generating Bindings..."

cd ./maps
python3 generator.py ./ffi.map.gen ../mjui/fltk_bindings/
cd ../

echo "Successfully generating bindings..."
