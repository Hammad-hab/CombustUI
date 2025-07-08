#ifndef MJUIINPUT_H
#define MJUIINPUT_H

class Input : public Fl_Input, public BaseWidget {
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
        Input(int x, int y, int w, int h, long int nid, int numericInput, char* label);
        virtual void draw() override;
};

class MultiLineInput : public Fl_Multiline_Input, public BaseWidget {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        Fl_Color placeHolderColor;
        const char* placeholder;
        virtual void setId(long int new_id) override;
        virtual void setBorderRadius(int radius) override;
        virtual int handle(int event) override;
        MultiLineInput(int x, int y, int w, int h, long int nid, char* label);
        virtual void draw() override;
};

#define FFI

Input* mjuiCreateInput(int x, int y, int w, int h, long int id, int numOnly, int8_t* label_r);
MultiLineInput* mjuiCreateMultilineInput(int x, int y, int w, int h, long int id, int8_t* label_r);
void mjuiSetInputValue(Fl_Input* input, int8_t* value);

#endif