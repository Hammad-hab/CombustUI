#include<FL/Fl_Scroll.H>

Fl_Scroll* mjuiScrollContainer(int x, int y, int w, int h) {
    Fl_Scroll* container = new Fl_Scroll(x, y, w, h);
    container->scrollbar.box(FL_FLAT_BOX);
    return container;
}

void mjuiScrollSetBarBGColor(Fl_Scroll* s, Fl_Color c, int sbar) {
    if (sbar == 0)  s->scrollbar.color(c);
    if (sbar == 1)  s->hscrollbar.color(c);
    if (sbar == 2)  {
        s->scrollbar.color(c);
        s->hscrollbar.color(c);
    }
}

void mjuiScrollSetBarFGColor(Fl_Scroll* s, Fl_Color c, int sbar) {
    if (sbar == 0)  s->scrollbar.color2(c);
    if (sbar == 1)  s->hscrollbar.color2(c);
    if (sbar == 2)  {
        s->scrollbar.color2(c);
        s->hscrollbar.color2(c);
    }
}
