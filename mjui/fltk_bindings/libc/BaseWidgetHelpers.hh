#ifndef MJUI_UTILS_H
#define MJUI_UTILS_H

#include <FL/Fl.H>
#include <FL/Fl_Widget.H>
#include <FL/Fl_Group.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Image.H>
#include <stdint.h>

#define FFI

int64_t mjuiGrabEvent();

void mjuiShowWidget(Fl_Widget *widget);
void mjuiHideWidget(Fl_Widget *widget);
void mjuiRedraw(Fl_Widget *widget);

void mjuiSetWidgetColor(Fl_Widget* widget, Fl_Color color);
void mjuiSetWidgetTextColor(Fl_Widget* widget, Fl_Color color);
void mjuiSetWidgetSelectionColor(Fl_Widget* widget, Fl_Color color);
void mjuiSetWidgetBox(Fl_Widget* widget, Fl_Boxtype box);
void mjuiSetWidgetLabel(Fl_Widget* widget, const char *label);

void BEGIN_WIDGET_APPEND(Fl_Group* group);
void END_WIDGET_APPEND(Fl_Group* group);

int mjuiGetWidgetHeight(Fl_Widget* widget);
int mjuiGetWidgetWidth(Fl_Widget* widget);

void mjuiWindowSetResizable(Fl_Window* window, Fl_Widget* widget);

void mjuiApplyImage(Fl_Widget* widget, Fl_Image* image);
void mjuiImageScale(Fl_Image* img, int width, int height, int proportional);

void useScheme(int scheme);

void fl_execute();
int fl_check();
int fl_ready();
int mjuiEventKey();

#endif