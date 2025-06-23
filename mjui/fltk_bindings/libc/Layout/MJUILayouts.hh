#ifndef MJUILAYOUTS_H
#define MJUILAYOUTS_H

#include<FL/Fl_Flex.H>
#include<FL/Fl_Grid.H>

#define RESIZE_XY 100
#define RESIZE_XONLY 110
#define RESIZE_YONLY 111

typedef int RESIZE;

class MJUI_Flex: public Fl_Flex {
    public: 
        RESIZE resize_direction;

        MJUI_Flex(int X, int Y, int W, int H, int DIR);
        virtual void resize(int X, int Y, int W, int H) override; 
        void setResizeDirection(RESIZE direction);
};  



MJUI_Flex* mjuiCreateLayoutFlex(int x, int y, int w, int h, int dir);
void mjuiSetFlexResize(MJUI_Flex* l, RESIZE r);
void mjuiSetFlexMarginGapSettings(MJUI_Flex* l, int margin, int gap);
void mjuiSetFlex(MJUI_Flex* l, Fl_Widget* w, int span);
void mjuiSetMarginExplicit(MJUI_Flex* l, int left, int top, int right, int bottom);

#endif