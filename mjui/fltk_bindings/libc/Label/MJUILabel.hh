#ifndef MJUILABEL_H
#include<FL/Fl_Box.H>

class MJUILabel: public Fl_Box, public BaseWidget 
{
    // TODO: Add more custom features
    public:
        long int id;
        virtual void setId(long int new_id) override;
        MJUILabel(int x, int y, int w, int h, int id, const char* label);
        void setLabelType(int a);
};

MJUILabel *mjuiCreateLabel(int x, int y, int width, int height, int8_t* text);
void mjuiSetTextProperties(MJUILabel *label, int size, int color, int type);


#endif