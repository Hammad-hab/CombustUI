#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUIButton.hh"

Button::Button(int x, int y, int w, int h, char* label): Fl_Button(x, y, w, h, label) {
    id=100000;
    isHovered = false;
    borderRadius = 2;
    labelcolor(FL_BLACK);
    
};


void Button::setId(long int new_id) {
    id = new_id;
}

int Button::handle(int event) {
        switch (event) {
            case FL_PUSH:
                enqueueEvent(id, event);
                return Fl_Button::handle(event); // Event handled

            case FL_ENTER: // Mouse enters button area
                // Optional: Change appearance or state for hover effect
                this->isHovered = true;
                redraw();
                return Fl_Button::handle(event); // Call base class for default behavior

            case FL_LEAVE: // Mouse leaves button area
                // Optional: Revert appearance or state
                this->isHovered = false;
                
                redraw();
                return Fl_Button::handle(event); // Call base class for default behavior

            default:
                return Fl_Button::handle(event); // Pass all other events to base class
        }
}

void Button::draw()
{

    if (this->isHovered)
        fl_color(color2());
    else
        fl_color(color());
    fl_rounded_rectf(x(), y(), w(), h(), borderRadius); // Set radius to 10
    fl_font(labelfont(), 14);
    fl_color(labelcolor());
    fl_draw(label(), x(), y(), w(), h(), FL_ALIGN_CENTER);
}

void Button::setBorderRadius(int radius)
{
    this->borderRadius = radius;
}


Button* mjuiCreateButton(int x, int y, int w, int h,  int8_t* label_r)
{
    char* label = int8ToChar(label_r);
    Button* btn = new Button(x, y, w, h, label);
    btn->box(FL_FLAT_BOX);
    return btn;
}