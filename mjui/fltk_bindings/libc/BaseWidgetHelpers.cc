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
        if (x.second == 0) continue;
        Events[x.first] = 0;
        uint64_t combined = ((uint64_t)x.first << 32) | x.second;
        return (combined);
    }
    return 2;
};

// uncomment later
// void load_img(Fl_Widget *widget, const char* file)
// {
//     Fl_JPEG_Image *img = new Fl_JPEG_Image(file);
//     img->scale(widget->w(), widget->h());
//     widget->image(img);
// }


void show_widget(Fl_Widget *widget) { widget->show(); }



void hide_widget(Fl_Widget *widget) { widget->hide(); }

void end_widget_child_append(Fl_Group *widget) { widget->end(); }

void begin_widget_child_append(Fl_Group *widget) { widget->begin(); }

/** Dimensions */
int get_height(Fl_Widget *widget) { return widget->h(); }

int get_width(Fl_Widget *widget) { return widget->w(); }

void set_widget_color(Fl_Widget *window, Fl_Color c) { window->color(c); }

void set_text_color(Fl_Widget *widget, Fl_Color c) { widget->labelcolor(c); }

void set_widget_color2(Fl_Widget *window, Fl_Color c) { window->color2(c); }
void set_widget_box(Fl_Widget *widget, Fl_Boxtype x) { widget->box(x); }
void mjuiSetWidgetLabel(Fl_Widget *widget, const char* label) { widget->label(label); }
void mjuiWindowSetResizable(Fl_Window *window, Fl_Widget* w) { window->resizable(w); }

#endif