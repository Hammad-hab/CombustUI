
#ifndef MJUIINPUT_H
#define MJUIINPUT_H

class Input : public Fl_Input, public BaseWidget {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        virtual void setId(long int new_id) override;
        virtual void setBorderRadius(int radius) override;
        virtual int handle(int event) override;
        Input(int x, int y, int w, int h, long int nid, char* label);
        // virtual void draw() override;
};

Input* mjuiCreateInput(int w, int h, int x, int y, long int id, int8_t* label_r);

#endif