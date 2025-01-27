#include <FL/Fl.H>
#include<stdio.h>
#include <unordered_map>
#include <string>

std::unordered_map<const char*, int> Events;

extern "C" {

    #include "fltk_widgets.cc"
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