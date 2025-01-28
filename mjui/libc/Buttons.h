
#include "fltk_utils.cc"

#ifndef Fl_Button_H
    #include <FL/Fl_Button.H>
#endif

#ifndef BTN
    #define BTN
    
    class Button : public Fl_Button {
    private:
        const char* id;

    public: 
        Button(int x, int y, int w, int h, const char* label) : Fl_Button(x, y, w, h, label) {
            id = "buttzon_new";
        }

        const char* getId() {
            return id;
        }

        void setId(const char* new_id) {
            id = new_id;
        }

        int handle(int event) override {
            switch (event) {
                case FL_PUSH:
                    // Handle push event (you need to define enqueueEvent)
                    return Fl_Button::handle(event);

                case FL_ENTER: // Mouse enters button area
                    // Optional: Change appearance or state for hover effect
                    return Fl_Button::handle(event);

                case FL_LEAVE: // Mouse leaves button area
                    // Optional: Revert appearance or state
                    return Fl_Button::handle(event);

                default:
                    return Fl_Button::handle(event); // Pass all other events to base class
            }
        }
    };

#endif