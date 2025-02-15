#include <FL/Fl.H>
#include<stdio.h>
#include <unordered_map>
#include <string>
#include <stdio.h>
#include "c_unsupport.cc"
#include "fltk_dialog.cc"
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

    void msg_dialog_bx(const int8_t* message_r)
    {   
        const char* msg = int8ToChar(message_r);
        // const char* heading = int8ToChar(heading_r);
        // char* path_icon = int8ToChar(path_icon_r);
        MJUI_DialogBox *dialog = new MJUI_DialogBox(0,0, 500, 150, msg);
        dialog->position(Fl::w()/2-250, Fl::h()/2-75);
        dialog->show();
    }

#ifdef __cplusplus
}
#endif