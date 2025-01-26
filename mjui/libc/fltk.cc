#include <FL/Fl.H>

extern "C" {

    #include "fltk_widgets.cc"

    void fltk_execute() {
        Fl::run();
    }
}