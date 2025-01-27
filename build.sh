cd mjui/libc
g++ -shared -Wc++11-extensions ./fltk.cc -o ./fltk.dylib `fltk-config --cxxflags --ldflags --libs`
# gcc -I/opt/homebrew/include/gtk-4.0 -I/opt/homebrew/include/glib-2.0 -I/opt/homebrew/lib/glib-2.0/include $(pkg-config --cflags gtk4) -o libgtk.dylib -shared gtk_ui.c $(pkg-config --libs gtk4)
cd ../../