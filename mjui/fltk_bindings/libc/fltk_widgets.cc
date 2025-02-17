#include <FL/Fl.H>
#include <FL/Fl_Double_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Input.H>
#include <FL/Fl_Grid.H>
#include <FL/Fl_Flex.H>
#include "Buttons.cc"
#include "Input.cc"
#include<stdint.h>
#include<stdio.h>
#include "MJUI_Flex.cc"




// Window
Fl_Double_Window *fltk_create_window_new(int width, int height, int8_t *title_r)
{
    char *title = int8ToChar(title_r);
    Fl_Double_Window *window = new Fl_Double_Window(width, height, title); // Create a window

    window->resizable(window);
    return window;
}


Button *fltk_create_button_new(int x, int y, int w, int h, int8_t *label_r)
{
    char *label = int8ToChar(label_r); // convert int8 to char
    Button *btn = new Button(x, y, w, h, label);
    btn->box(FL_FLAT_BOX);
    btn->label(label);
    return btn;
}


Input *fltk_create_input_new(int x, int y, int w, int h, int8_t *label_r)
{
    char *label = int8ToChar(label_r); // convert int8 to char
    Input *input = new Input(x, y, w, h, label);
    input->box(FL_FLAT_BOX);
    input->label(label);

    return input;
}


Fl_Grid *fltk_layout_grid(int x, int y, int w, int h)
{
    Fl_Grid *grid = new Fl_Grid(x, y, w, h);
    grid->col_width(2, 3);
    return grid;
}

MJUI_Flex *fltk_layout_flex(int x, int y, int w, int h, int dir=Fl_Flex::HORIZONTAL)
{
    MJUI_Flex *flex = new MJUI_Flex(x, y, w, h, Fl_Flex::HORIZONTAL);
    // flex->resizable(invisible_box);
    return flex;
}


Fl_Grid *fltk_set_grid_layout_dimensions(Fl_Grid *grid, int rows, int columns, int margin, int gap)
{   
    grid->layout(rows, columns, margin, gap);
    return grid;
}

Fl_Box* fltk_create_label(int x, int y, int w, int h, int8_t *label_r) {
    char *label = int8ToChar(label_r);
    Fl_Box *label_el = new Fl_Box(x, y, w, h, label);
    return label_el;
}

void fltk_grid_assign_pos(Fl_Grid *grid, Fl_Widget *widget, int row, int col) {
    grid->widget(widget, row, col);
}


const char* get_input_value(Fl_Input *input)
{
    const char* value = (input->value());
    return (value);
}


void set_id (Button *widget, long int id) {
    widget->setId(id);
}

Fl_Box *fltk_create_image(const char* path) {
    return create_image(path);
}


Fl_Box *fltk_create_empty(int x, int y, int w, int h) {
    Fl_Box *box = new Fl_Box(x, y, w, h);
    return box;
}
