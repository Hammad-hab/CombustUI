gcc -dynamiclib -o libwidget.dylib Widget.c $(pkg-config --cflags gtk4) $(pkg-config --libs gtk4)
