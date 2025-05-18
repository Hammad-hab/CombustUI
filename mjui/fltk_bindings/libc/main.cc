#include "utils.cc"
#include <unordered_map>
#include <string>
#include <stdio.h>
#include <FL/Fl.H>
#include<FL/Fl_JPEG_Image.H>
#include <FL/Fl.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Check_Button.H>
#include <FL/Fl_Input.H>
#include <FL/Fl_Multiline_Input.H>
#include <FL/fl_draw.H>



std::unordered_map<int, int> Events;


#ifdef __cplusplus
extern "C" {
#endif

    #include "Window/MJUIWindow.cc"
    #include "Label/MJUILabel.cc"
    #include "Button/MJUIButton.cc"
    #include "Input/MJUIInput.cc"
    #include "Layout/MJUILayouts.cc"
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

    void set_id_button(Button *btn, long int id) {btn->setId(id);}

#ifdef __cplusplus
}
#endif
