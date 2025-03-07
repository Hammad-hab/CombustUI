# cd mjui/fltk_bindings/libc/deprecated
# echo "Compiling mjui-fltk bindings..."
# g++ -shared -Wc++11-extensions ./fltk.cc -o ../out/fltk.dylib `fltk-config --cxxflags --ldflags --libs` -std=c++11 -lfltk_images
# # gcc -I/opt/homebrew/include/gtk-4.0 -I/opt/homebrew/include/glib-2.0 -I/opt/homebrew/lib/glib-2.0/include $(pkg-config --cflags gtk4) -o libgtk.dylib -shared gtk_ui.c $(pkg-config --libs gtk4)
# cd ../../../
# echo "Successfully compiled"

cd mjui/fltk_bindings/libc/
echo "Compiling mjui-fltk bindings..."
g++ -shared -Wc++11-extensions ./main.cc -o ./out/mjui.dylib -I./ `fltk-config --cxxflags --ldflags --libs` -std=c++11 -lfltk_images
# gcc -I/opt/homebrew/include/gtk-4.0 -I/opt/homebrew/include/glib-2.0 -I/opt/homebrew/lib/glib-2.0/include $(pkg-config --cflags gtk4) -o libgtk.dylib -shared gtk_ui.c $(pkg-config --libs gtk4)
cd ../../
echo "Successfully compiled"
