#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUIInput.hh"
#include <FL/Fl_Input.H>
#include <FL/Fl_Multiline_Input.H>

#include <cstring>
#include "string.h"

Input::Input(int x, int y, int w, int h, long int nid, char *label) : Fl_Input(x, y, w, h, "")
{
    id = nid;
    isHovered = false;
    borderRadius = 2;
    placeholder = label;
    placeHolderColor = FL_DARK2;
    textcolor(placeHolderColor);
    cursor_color(FL_BLACK);
    value(placeholder);
};

void Input::setId(long int new_id)
{
    id = new_id;
}

int Input::handle(int event)
{
    if (event == FL_FOCUS)
    {
        if (strcmp(value(), placeholder) == 0)
        {
            value("");
            textcolor(FL_BLACK);
        }
    }
    if (event == FL_UNFOCUS)
    {
        if (strlen(value()) <= 0)
        {
            value(placeholder);
            textcolor(placeHolderColor);
        }
    }

   enqueueEvent(id, event);
    Fl_Input::handle(event);
    return 1;
}

void Input::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}

void Input::draw()
{   
    Fl_Input::draw();
}

MultiLineInput::MultiLineInput(int x, int y, int w, int h, long int nid, char *label) : Fl_Multiline_Input(x, y, w, h, "")
{
    id = nid;
    isHovered = false;
    borderRadius = 2;
    placeholder = label;
    placeHolderColor = FL_DARK2;
    textcolor(placeHolderColor);
    cursor_color(FL_BLACK);
    value(placeholder);
};

void MultiLineInput::setId(long int new_id)
{
    id = new_id;
}

int MultiLineInput::handle(int event)
{
    if (event == FL_FOCUS)
    {
        if (strcmp(value(), placeholder) == 0)
        {
            value("");
            textcolor(FL_BLACK);
        }
    }
    if (event == FL_UNFOCUS)
    {
        if (strlen(value()) <= 0)
        {
            value(placeholder);
            textcolor(placeHolderColor);
        }
    }
   enqueueEvent(id, event);
    Fl_Multiline_Input::handle(event);
    return 1;
}

void MultiLineInput::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}

void MultiLineInput::draw()
{
    Fl_Multiline_Input::draw();
}

const char *mjuiGrabInput(Input *ptr)
{
    return ptr->value();
}

Input *mjuiCreateInput(int x, int y, int w, int h, long int id, int8_t *label_r)
{
    char *label = int8ToChar(label_r);
    Input *in = new Input(x, y, w, h, id, label);
    return in;
}

MultiLineInput *mjuiCreateMultilineInput(int x, int y, int w, int h, long int id, int8_t *label_r)
{
    char *label = int8ToChar(label_r);
    MultiLineInput *in = new MultiLineInput(x, y, w, h, id, label);
    return in;
}

void mjuiSetInputValue(Fl_Input *input, int8_t *value)
{
    char *vlu = int8ToChar(value);
    input->value(vlu);
}