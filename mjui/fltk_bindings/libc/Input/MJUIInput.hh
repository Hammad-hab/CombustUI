#ifndef MJUIINPUT_H
#define MJUIINPUT_H

class MJUI_Input : public Fl_Input, public BaseWidget {
    public: 
        long int id;
        int borderRadius;
        int numOnly;
        bool isHovered;
        Fl_Color placeHolderColor;
        const char* placeholder;
        virtual void setId(long int new_id) override;
        virtual void setBorderRadius(int radius) override;
        virtual int handle(int event) override;
        MJUI_Input(int x, int y, int w, int h, long int nid, int numericInput, char* label);
        virtual void draw() override;
};

class MJUI_MultiLineInput : public Fl_Multiline_Input, public BaseWidget {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        Fl_Color placeHolderColor;
        const char* placeholder;
        virtual void setId(long int new_id) override;
        virtual void setBorderRadius(int radius) override;
        virtual int handle(int event) override;
        MJUI_MultiLineInput(int x, int y, int w, int h, long int nid, char* label);
        virtual void draw() override;
};

#define FFI

MJUI_Input* mjuiCreateInput(int x, int y, int w, int h, long int id, int numOnly, int8_t* label_r);
MJUI_MultiLineInput* mjuiCreateMultilineInput(int x, int y, int w, int h, long int id, int8_t* label_r);
Fl_Choice* mjuiCreateChoice(int x, int y, int w, int h);
void mjuiSetInputValue(MJUI_Input* input, int8_t* value);
const char* mjuiGrabInput(Fl_Input_ *ptr);
int mjuiGrabChoice(Fl_Choice *ptr);
void mjuiAddOptionToChoice(Fl_Choice* input, int8_t* choice);

#endif