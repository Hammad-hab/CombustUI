#ifndef MJUIBUTTON_H
#define MJUIBUTTON_H

#include <FL/Fl_Button.H>
#include <FL/Fl_Check_Button.H>

class MJUI_Button : public Fl_Button {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        virtual int handle(int event) override;
        MJUI_Button(int x, int y, int w, int h, long int nid, char* label);
        virtual void draw() override;
};


class MJUI_CheckButton : public Fl_Check_Button {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        virtual int handle(int event) override;
        MJUI_CheckButton(int x, int y, int w, int h, long int nid, char* label);
        virtual void draw() override;
};

#define FFI

MJUI_Button* mjuiCreateButton(int x, int y, int w, int h, long int id, int8_t* label_r);
MJUI_CheckButton* mjuiCreateCheckButton(int x, int y, int w, int h, long int id, int8_t* label_r);
int mjuiCheckButtonGetState(MJUI_CheckButton* checkButton);

#endif