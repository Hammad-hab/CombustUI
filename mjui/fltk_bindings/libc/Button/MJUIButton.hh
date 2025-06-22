
#ifndef MJUIBUTTON_H
#define MJUIBUTTON_H

class Button : public Fl_Button, public BaseWidget {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        virtual void setId(long int new_id) override;
        virtual void setBorderRadius(int radius) override;
        virtual int handle(int event) override;
        Button(int x, int y, int w, int h, long int nid, char* label);
        virtual void draw() override;
};

Button* mjuiCreateButton(int w, int h, int x, int y, long int id, int8_t* label_r);


class MJUI_CheckButton : public Fl_Check_Button, public BaseWidget {
    public: 
        long int id;
        int borderRadius;
        bool isHovered;
        virtual void setId(long int new_id) override;
        virtual void setBorderRadius(int radius) override;
        virtual int handle(int event) override;
        MJUI_CheckButton(int x, int y, int w, int h, long int nid, char* label);
        virtual void draw() override;
};

MJUI_CheckButton* mjuiCreateCheckButton(int w, int h, int x, int y, long int id, int8_t* label_r);

int mjuiCheckButtonGetState(MJUI_CheckButton* checkButton);

#endif