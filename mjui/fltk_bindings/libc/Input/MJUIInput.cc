#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUIInput.hh"
#include <FL/Fl_Input.H>
#include <FL/Fl_Multiline_Input.H>
#include<cstring>
#include "string.h"


Input::Input(int x, int y, int w, int h, long int nid, char* label): Fl_Input(x, y, w, h, "") {
    id=nid;
    isHovered = false;
    borderRadius = 2;
    placeholder = label;
    placeHolderColor = FL_DARK2;
    textcolor(placeHolderColor);
    value(placeholder);
};


void Input::setId(long int new_id) {
    id = new_id;
}

int Input::handle(int event) {
        if (event == FL_KEYDOWN) {
            const char* text = Fl::event_text();
            int key = Fl::event_key();
            const char* initialValue = value();
            if (key == FL_BackSpace && strlen(initialValue) <= 0){
                value(placeholder);
                textcolor(placeHolderColor);
                return 1;
            }
            if (strstr(initialValue, placeholder) != NULL) {
                value("");
                textcolor(FL_BLACK);
            }
        }
        Fl_Input::handle(event);
        return 1;
}



void Input::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}


void Input::draw() { 
    Fl_Input::draw();
}

const char* mjuiGrabInput(Input* ptr) 
{
    return ptr->value();
}

Input* mjuiCreateInput(int x, int y, int w, int h, long int id, int8_t* label_r)
{
    char* label = int8ToChar(label_r);
    Input* in = new Input(x, y, w, h, id, label);
    return in;
}


Fl_Multiline_Input* mjuiCreateMultilineInput(int x, int y, int w, int h, long int id, int8_t* label_r)
{
    char* label = int8ToChar(label_r);
    Fl_Multiline_Input* in = new Fl_Multiline_Input(x, y, w, h, label);
    return in;
}