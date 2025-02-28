#include <FL/Fl.H>
#include <unordered_map>
#include <string>
#include <stdio.h>
#include "utils.cc"

std::unordered_map<int, int> Events;


extern "C" {

    #include "Window/MJUIWindow.cc"
    #include "BaseWidgetHelpers.cc"

    void fltk_execute() {
        Fl::run();
    }

    int fltk_check() {
        return Fl::check();
    }

    int fltk_ready() {
        return Fl::ready();
    }

}