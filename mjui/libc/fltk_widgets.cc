#include <FL/Fl.H>
#include <FL/Fl_Double_Window.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Button.H>
#include <FL/Fl_Input.H>
#include <FL/Fl_Grid.H>
#include "fltk_utils.cc"
#include<stdint.h>

// Window
Fl_Double_Window *fltk_create_window_new(int width, int height, char *title)
{
    Fl_Double_Window *window = new Fl_Double_Window(width, height, title); // Create a window
    window->resizable(window);
    return window;
}


Fl_Button *fltk_create_button_new(int x, int y, int w, int h, int8_t *label_r)
{
    char *label = int8ToChar(label_r); // convert int8 to char
    Fl_Button *btn = new Fl_Button(x, y, w, h, label);
    btn->box(FL_FLAT_BOX);
    btn->label(label);
    return btn;
}


Fl_Input *fltk_create_input_new(int x, int y, int w, int h, int8_t *label_r)
{
    char *label = int8ToChar(label_r); // convert int8 to char
    Fl_Input *input = new Fl_Input(x, y, w, h, label);
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

Fl_Grid *fltk_set_grid_layout_dimensions(Fl_Grid *grid, int rows, int columns, int margin, int gap)
{   
    grid->layout(rows, columns, margin, gap);
    return grid;
}

void fltk_grid_assign_pos(Fl_Grid *grid, Fl_Widget *widget, int row, int col) {
    grid->widget(widget, row, col);
}