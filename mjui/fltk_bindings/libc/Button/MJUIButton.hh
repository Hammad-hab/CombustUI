#include <FL/Fl_Double_Window.H>

#ifndef MJUIWINDOW_H
#define MJUIWINDOW_H

Fl_Double_Window *mjuiCreateWindow(int width,
                                   int height,
                                   int resize,
                                   int fullscreen,
                                   int no_border, int8_t *title_r);

#endif