#include "./MJUILayouts.hh"
#include "./Containers.cc"


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
    l->resize(x, y, w, h);
    l->layout();
    l->init_sizes();    // Initialize preferred sizes
    l->layout();        // Do another layout pass after init_sizes
    l->redraw();
    
    // Force the parent window to recalculate layout if it exists
    if (l->window()) {
        l->window()->init_sizes();
        l->window()->redraw();
    }
    
    return l;
}

void mjuiSetFlexResize(MJUI_Flex* l, RESIZE r) {
    l->setResizeDirection(r);
}

void mjuiFlexCalculateLayout(MJUI_Flex* l) {
    l->layout();
    l->redraw();
}

void mjuiSetFlexMarginGapSettings(MJUI_Flex* l, int margin, int gap)
{
    if (gap != -1) 
    {
        l->gap(gap);
    }
    if (margin != -1)
    {
        l->margin(margin);
    }
} 

void mjuiSetMarginExplicit(MJUI_Flex* l, int left, int top, int right, int bottom)
{
    l->margin(left, top, right, left);
}

void mjuiSetFlex(MJUI_Flex* l, Fl_Widget*w,  int span) {
    l->fixed(w, span);
}

