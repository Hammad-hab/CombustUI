#include<FL/Fl_Scroll.H>

#ifndef CONTAINERS_H
#define CONTAINERS_H
#define FFI
Fl_Scroll* mjuiScrollContainer(int x, int y, int w, int h);
void mjuiScrollSetBarBGColor(Fl_Scroll* s, Fl_Color c, int sbar);
void mjuiScrollSetBarFGColor(Fl_Scroll* s, Fl_Color c, int sbar);
void mjuiScrollBy(Fl_Scroll* s, int x, int y);
#endif