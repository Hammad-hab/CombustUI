#include <FL/Fl_Double_Window.H>

#ifndef MJUIWINDOW_H
#define MJUIWINDOW_H

#define WINDOW_VISIBLE 0
#define WINDOW_MINIMIZED 1

Fl_Double_Window *mjuiCreateWindow(int width,
                                   int height,
                                   int resize,
                                   int fullscreen,
                                   int no_border, int8_t *title_r);

void mjuiWindowTitleSet(Fl_Double_Window* window, int8_t* new_title_r);
int mjuiWindowVisibilityStatus(Fl_Double_Window* window, int condition);
void mjuiWindowPositionSet(Fl_Double_Window* window, int x, int y);
#endif