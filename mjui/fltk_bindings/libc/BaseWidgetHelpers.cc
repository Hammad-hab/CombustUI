// #ifndef BASEWIDGET_HELPERS
// #define BASEWIDGET_HELPERS

// #include<stdio.h>
// #include<FL/Fl_Widget.H>
// #include<FL/Fl_Group.H>
// #include<FL/Fl_Window.H>

// #include "BaseWidgetHelpers.hh"

// /** Example Events store (adjust to your actual global) */

// /** Event Handling */
// void enqueueEvent(int id, int event) {
//     Events[id] = event;
// }

// void mjuiUnqueueEvent(int id) {
//     Events[id] = 0;
// }

// int mjuiWidgetHandle(int id, int event) {
//     mjuienqueueEvent(id, event);
//     return event;
// }

// int64_t mjuiGrabEvent() {
//     for (auto &x : Events) {
//         if (x.second == -2) continue;
//         int id = x.first;
//         int event = x.second;
//         Events[id] = -2;
//         uint64_t combined = ((uint64_t)id << 32) | (uint32_t)event;
//         return combined;
//     }
//     return -2;
// }

// /** Widget Show/Hide/Redraw */
// void mjuiShowWidget(Fl_Widget *widget) {
//     widget->show();
// }

// void mjuiHideWidget(Fl_Widget *widget) {
//     widget->hide();
// }

// void mjuiRedraw(Fl_Widget *widget) {
//     widget->redraw();
//     Fl::flush();
//     Fl::check();
// }

// /** Widget Properties */
// void mjuiSetWidgetColor(Fl_Widget *widget, Fl_Color color) {
//     widget->color(color);
// }

// void mjuiSetWidgetTextColor(Fl_Widget *widget, Fl_Color color) {
//     widget->labelcolor(color);
// }

// void mjuiSetWidgetSelectionColor(Fl_Widget *widget, Fl_Color color) {
//     widget->color2(color);
// }

// void mjuiSetWidgetBox(Fl_Widget *widget, Fl_Boxtype box) {
//     widget->box(box);
// }

// void mjuiSetWidgetLabel(Fl_Widget *widget, const char *label) {
//     widget->label(label);
// }

// /** Widget Child Management */
// void mjuiBeginWidgetAppend(Fl_Group *group) {
//     group->begin();
// }

// void mjuiEndWidgetAppend(Fl_Group *group) {
//     group->end();
// }

// /** Dimensions */
// int mjuiGetWidgetHeight(Fl_Widget *widget) {
//     return widget->h();
// }

// int mjuiGetWidgetWidth(Fl_Widget *widget) {
//     return widget->w();
// }

// /** Window Specific */
// void mjuiWindowSetResizable(Fl_Window *window, Fl_Widget *widget) {
//     window->resizable(widget);
// }

// /** Image Handling */
// void mjuiApplyImage(Fl_Widget *widget, Fl_Image *image) {
//     widget->image(image);
// }

// void mjuiImageScale(Fl_Image *img, int width, int height, int proportional) {
//     img->scale(width, height, proportional);
// }

// #endif

#include<stdio.h>
#include<FL/Fl_Widget.H>
#include<FL/Fl_Group.H>
#include<FL/Fl_Window.H>

#ifndef UTILS

#define UTILS

void enqueueEvent(int id, int event) { Events[id] = event; }

void unqueueEvent(int id) { Events[id] = 0; }

int widgetHandle(int id, int event) { enqueueEvent(id, event); return event; }

int64_t listEvents() {
    for (auto x : Events) {
        if (x.second == -2) continue;
        Events[x.first] = -2;
        uint64_t combined = ((uint64_t)x.first << 32) | x.second;
        return (combined);
    }
    return -2;
};



void show_widget(Fl_Widget *widget) { widget->show(); }

void mjuiApplyImage(Fl_Widget *w, Fl_Image* img) { w->image(img); }
void mjuiImageScale(Fl_Image* img, int w, int h, int propotional) { 
    img->scale(w, h, propotional);
}


void hide_widget(Fl_Widget *widget) { widget->hide(); }

void end_widget_child_append(Fl_Group *widget) { widget->end(); }

void begin_widget_child_append(Fl_Group *widget) { widget->begin(); }

/** Dimensions */
int get_height(Fl_Widget *widget) { return widget->h(); }

int get_width(Fl_Widget *widget) { return widget->w(); }

void set_widget_color(Fl_Widget *window, Fl_Color c) { window->color(c); }

void set_text_color(Fl_Widget *widget, Fl_Color c) { widget->labelcolor(c); }

void set_widget_color2(Fl_Widget *window, Fl_Color c) { window->color2(c); }
void mjuiSetWidgetBox(Fl_Widget *widget, Fl_Boxtype x) { widget->box(x); }
void mjuiSetWidgetLabel(Fl_Widget *widget, const char* label) { widget->label(label); }
void mjuiWindowSetResizable(Fl_Window *window, Fl_Widget* w) { window->resizable(w); }

void redraw(Fl_Widget* w) {
    w->redraw();
    Fl::flush();
    Fl::check();
}

#endif