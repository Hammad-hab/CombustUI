#ifndef MJUILABEL_H
#include<FL/Fl_Box.H>

#define PNG 0
#define JPEG 1
#define SVG 2
#define BMP 3
#define GIF 4
#define ANIM_GIF 5

class MJUILabel: public Fl_Box, public BaseWidget 
{
    // TODO: Add more custom features
    public:
        long int id;
        virtual void setId(long int new_id) override;
        MJUILabel(int x, int y, int w, int h, int id, const char* label);
        void setLabelType(int a);
        virtual int handle(int event) override;
        virtual void draw() override;
};

MJUILabel* mjuiCreateLabel(int x, int y, int width, int height, int id, int8_t* text);
void mjuiSetTextProperties(MJUILabel *label, int size, int color, int type);
void mjuiTextAlign(MJUILabel *label, int alignment);
Fl_Image* load_img(int width, int height, int imgType, int8_t* path);

#endif