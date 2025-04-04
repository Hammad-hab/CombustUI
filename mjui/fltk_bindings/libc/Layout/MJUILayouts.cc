#include "./MJUILayouts.hh"


MJUI_Flex::MJUI_Flex(int X, int Y, int W, int H, int DIR): Fl_Flex(X, Y, W, H, DIR)
{
    // ...
    this->resize_direction = RESIZE_XONLY;
}

void MJUI_Flex::resize(int X, int Y, int W, int H)
{
    switch (this->resize_direction)
    {
    case RESIZE_XY:
        Fl_Flex::resize(X, Y, W, H);
        break;

    case RESIZE_XONLY:
        Fl_Flex::resize(X, Y, W, this->h());
        break;

    case RESIZE_YONLY:
        Fl_Flex::resize(X, Y, this->w(), H);
        break;
    
    default:
        break;
    }
}


void MJUI_Flex::setResizeDirection(RESIZE direction)
{
    this->resize_direction = direction;
} 

MJUI_Flex* mjuiCreateLayoutFlex(int x, int y, int w, int h, int dir)
{
    MJUI_Flex* l = new MJUI_Flex(x, y, w, h, dir);
    return l;
}

void mjuiSetFlexResize(MJUI_Flex* l, RESIZE r) {
    l->setResizeDirection(r);
}