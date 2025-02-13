#include<stdint.h>
#include<cstring>
#include <FL/Fl.H>
#include <FL/Fl_Widget.H>
#include <stdexcept>

using namespace std;

#ifndef FLTK_UTILS_H

#define FLTK_UTILS_H

int* charToInt8(const char *charArray) {
    // First, determine the length of the input array
    size_t length = strlen(charArray);

    // Allocate memory for the int8_t array
    int *int8Array = new int[length + 1]; // +1 for null terminator

    // Copy each character to int8_t array
    for (size_t i = 0; i < length; ++i) {
        int8Array[i] = static_cast<int>(charArray[i]);
    }

    // Null-terminate the int8_t array (optional, depending on use case)
    int8Array[length] = '\0'; // Only if you need a null terminator

    return int8Array;
}

char *int8ToChar(const int8_t *int8Array) {
    // First, determine the length of the input array
    size_t length = 0;
    while (int8Array[length] != '\0') {
        length++;
    }

    // Allocate memory for the char array (+1 for null terminator)
    char *charArray = new char[length + 1];

    // Copy the int8_t values to char array
    memcpy(charArray, int8Array, length);

    // Null-terminate the char array
    charArray[length] = '\0';

    return charArray;
}


/** Methods */
void set_widget_box(Fl_Widget *widget, Fl_Boxtype x)
{
    widget->box(x);
}


void set_window_cusror(Fl_Window *widget, Fl_Cursor c)
{
    widget->cursor(c);
}

void set_widget_callback(Fl_Widget *widget, Fl_Callback0 callback)
{
    widget->callback(callback);
}

void set_widget_color(Fl_Widget *window, Fl_Color c)
{
    window->color(c);
}

void set_text_color(Fl_Widget *widget, Fl_Color c)
{
    widget->labelcolor(c);
}


void set_widget_color2(Fl_Widget *window, Fl_Color c)
{
    window->color2(c);
}


void show_widget(Fl_Widget *widget)
{
    widget->show();
}

void hide_widget(Fl_Widget *widget)
{
    widget->hide();
}


void end_widget_child_append(Fl_Group *widget) {
    widget->end();
}

void begin_widget_child_append(Fl_Group *widget) {
    widget->begin();
}

/** Dimensions */
int get_height(Fl_Widget *widget) {
    return widget->h();
}

int get_width(Fl_Widget *widget) {
    return widget->w();
}


#endif