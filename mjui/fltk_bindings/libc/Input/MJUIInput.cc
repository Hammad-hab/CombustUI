#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUIInput.hh"
#include <FL/Fl_Input.H>
#include <FL/Fl_Multiline_Input.H>

#include <cstring>
#include "string.h"

MJUI_Input::MJUI_Input(int x, int y, int w, int h, long int nid, int numericInput, char *label) : Fl_Input(x, y, w, h, "")
{
    id = nid;
    isHovered = false;
    borderRadius = 2;
    placeholder = label;
    numOnly = numericInput;
    placeHolderColor = FL_DARK2;
    textcolor(placeHolderColor);
    cursor_color(FL_BLACK);
    value(placeholder);
};

void MJUI_Input::setId(long int new_id)
{
    id = new_id;
}

int MJUI_Input::handle(int event)
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
    if (event == FL_KEYBOARD && numOnly)
    {
        int key = Fl::event_key();

        // TODO Add support for numpad numbers
        if (key >= 48 && key <= 57 || key == FL_BackSpace)
        {
            Fl_Input::handle(event);
        }
    }
    else
    {
        Fl_Input::handle(event);
    }
    return 1;
}

void MJUI_Input::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}

void MJUI_Input::draw()
{
    Fl_Input::draw();
}

MJUI_MultiLineInput::MJUI_MultiLineInput(int x, int y, int w, int h, long int nid, char *label) : Fl_Multiline_Input(x, y, w, h, "")
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

void MJUI_MultiLineInput::setId(long int new_id)
{
    id = new_id;
}

int MJUI_MultiLineInput::handle(int event)
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

void MJUI_MultiLineInput::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}

void MJUI_MultiLineInput::draw()
{
    Fl_Multiline_Input::draw();
}

const char *mjuiGrabInput(Fl_Input_ *ptr)
{
    return ptr->value();
}

int mjuiGrabChoice(Fl_Choice *ptr)
{
    return ptr->value();
}

MJUI_Input *mjuiCreateInput(int x, int y, int w, int h, long int id, int numOnly, int8_t *label_r)
{
    char *label = int8ToChar(label_r);
    MJUI_Input *in = new MJUI_Input(x, y, w, h, id, numOnly, label);
    return in;
}

MJUI_MultiLineInput *mjuiCreateMultilineInput(int x, int y, int w, int h, long int id, int8_t *label_r)
{
    char *label = int8ToChar(label_r);
    MJUI_MultiLineInput *in = new MJUI_MultiLineInput(x, y, w, h, id, label);
    return in;
}

Fl_Choice *mjuiCreateChoice(int x, int y, int w, int h)
{
    Fl_Choice *choice = new Fl_Choice(x, y, w, h, "");
    return choice;
}

void mjuiSetInputValue(MJUI_Input *input, int8_t *value)
{
    char *vlu = int8ToChar(value);
    input->value(vlu);
}

void mjuiAddOptionToChoice(Fl_Choice* input, int8_t* choice)
{
     char *vlu = int8ToChar(choice);
    input->add(vlu);
}