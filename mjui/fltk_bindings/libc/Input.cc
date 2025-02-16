#include <FL/Fl.H>
#include <FL/Fl_Double_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Input.H>

#include "BaseWidgetHelpers.cc"
#include "fltk_utils.cc"
#include "BaseWidget.cc"


class Input : public Fl_Input, public  MJUI_Widget {
    public: 
        Input(int x, int y, int w, int h, char* label): Fl_Input(x, y, w, h, label), MJUI_Widget() {
            id=110000;
        };
    
    int handle(int event) override {
        switch (event) {
            case FL_KEYDOWN:
                enqueueEvent(id, event);
                return Fl_Input::handle(event); // Event handled

            case FL_KEYUP: // Mouse enters button area
                enqueueEvent(id, event);
                // Optional: Change appearance or state for hover effect
                return Fl_Input::handle(event); // Call base class for default behavior
                

            case FL_LEAVE: // Mouse leaves button area
                // Optional: Revert appearance or state
                return Fl_Input::handle(event); // Call base class for default behavior

            default:
                return Fl_Input::handle(event); // Pass all other events to base class
        }
    }

};

