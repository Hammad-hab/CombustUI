#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUIInput.hh"

#include "string.h"

Input::Input(int x, int y, int w, int h, long int nid, char* label): Fl_Input(x, y, w, h, label) {
    id=nid;
    isHovered = false;
    borderRadius = 2;
    labelcolor(FL_BLACK);
    
};


void Input::setId(long int new_id) {
    id = new_id;
}

int Input::handle(int event) {
        Fl_Input::handle(event);
        return 1;
}

void Input::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}

const char* mjuiGrabInput(Input* ptr) 
{
    return ptr->value();
}

Input* mjuiCreateInput(int x, int y, int w, int h, long int id, int8_t* label_r)
{
    char* label = int8ToChar(label_r);
    Input* btn = new Input(x, y, w, h, id, label);
    return btn;
}