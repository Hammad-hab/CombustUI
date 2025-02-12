#include <FL/Fl.H>
#include<stdio.h>
#include <unordered_map>
#include <string>
#include "c_unsupport.cc"
std::unordered_map<int, int> Events;


#ifdef __cplusplus
extern "C" {
#endif

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

#ifdef __cplusplus
}
#endif