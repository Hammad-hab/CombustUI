#include <FL/Fl.H>
#include <FL/Fl_Double_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Button.H>
#include "BaseWidgetHelpers.cc"
#include "fltk_utils.cc"
#include "BaseWidget.cc"


class Button : public Fl_Button, public  MJUI_Widget {
    public: 
        long int id;
        Button(int x, int y, int w, int h, char* label): Fl_Button(x, y, w, h, label) {
            id=100000;
        };

    void setId(long int new_id) override {
        id = new_id;
    }
       
    int handle(int event) override {
        switch (event) {
            case FL_PUSH:
                enqueueEvent(id, event);
                return Fl_Button::handle(event); // Event handled

            case FL_ENTER: // Mouse enters button area
                // Optional: Change appearance or state for hover effect
                return Fl_Button::handle(event); // Call base class for default behavior

            case FL_LEAVE: // Mouse leaves button area
                // Optional: Revert appearance or state
                return Fl_Button::handle(event); // Call base class for default behavior

            default:
                return Fl_Button::handle(event); // Pass all other events to base class
        }
    }

};

