#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUIButton.hh"
#include "string.h"

Button::Button(int x, int y, int w, int h, long int nid, char* label): Fl_Button(x, y, w, h, label) {
    id=nid;
    isHovered = false;
    borderRadius = 2;
    labelcolor(FL_BLACK);
    
};


void Button::setId(long int new_id) {
    id = new_id;
}

int Button::handle(int event) {
        if (event == FL_ENTER) {
            isHovered = true;
           enqueueEvent(id, event);
            redraw();
            return 1;
        }

        if (event == FL_LEAVE) {
            isHovered = false;
           enqueueEvent(id, event);
            redraw();
            return 1;
        }
       enqueueEvent(id, event);

        return 1; // Pass all other events to base class
}

void Button::draw()
{
    const char* button_label = label();
    if (this->isHovered)
        fl_color(color2());
    else
        fl_color(color());
    fl_rounded_rectf(x(), y(), w(), h(), borderRadius); // Set radius to 10
    fl_font(labelfont(), 14);
    fl_color(labelcolor());
    fl_draw(button_label, x(), y(), w(), h(), FL_ALIGN_CENTER);
}

void Button::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}


Button* mjuiCreateButton(int x, int y, int w, int h, long int id, int8_t* label_r)
{
    char* label = int8ToChar(label_r);
    Button* btn = new Button(x, y, w, h, id, label);
    btn->box(FL_FLAT_BOX);
    return btn;
}


MJUI_CheckButton::MJUI_CheckButton(int x, int y, int w, int h, long int id, char* label): Fl_Check_Button(x, y, w, h, label) {
    id = id;
    isHovered = false;
    borderRadius = 2;
}

void MJUI_CheckButton::setId(long int new_id) {
    id = new_id;
}

void MJUI_CheckButton::setBorderRadius(int radius) {
    this->borderRadius = radius;
}

int MJUI_CheckButton::handle(int event) {
    if (event == FL_ENTER) {
        isHovered = true;
       enqueueEvent(id, event);
        redraw();
        return 1;
    }

    if (event == FL_LEAVE) {
        isHovered = false;
       enqueueEvent(id, event);
        redraw();
        return 1;
    }
   enqueueEvent(id, event);

    return Fl_Check_Button::handle(event); // Pass all other events to base class
}

void MJUI_CheckButton::draw() {
    const char* button_label = label();
    if (this->isHovered)
        fl_color(color2());
    else
        fl_color(color());
    Fl_Check_Button::draw();
}

MJUI_CheckButton* mjuiCreateCheckButton(int x, int y, int w, int h, long int id, int8_t* label_r) {
    char* label = int8ToChar(label_r);
    MJUI_CheckButton* btn = new MJUI_CheckButton(x, y, w, h, id, label);
    btn->box(FL_FLAT_BOX);
    return btn;
}

int mjuiCheckButtonGetState(MJUI_CheckButton* checkButton) {
    return checkButton->value();
}

