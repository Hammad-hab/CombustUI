
#ifndef MJUIBUTTON_H
#define MJUIBUTTON_H


class Button : public Fl_Button, public BaseWidget {
    public: 
        long int id;
        virtual void setId(long int new_id) override;
        virtual int handle(int event) override;
        Button(int x, int y, int w, int h, char* label);

};

Button* mjuiCreateButton(int w, int h, int x, int y, int8_t* label_r);

#endif