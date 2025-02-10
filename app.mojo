from mjui._app import Application, FLTK_WIDGET_POINTER
from mjui.dll import *
from memory.pointer import Pointer
from mjui.dll import __dll
from mjui.utils import readFromStringBytes

var app = Application()
fn pnt() raises:
    var pointer = app.getElementById(110002)
    var bytes = get_input_value(pointer)
    # print(bytes._len)
    var value = readFromStringBytes(bytes)
    print(value)

fn main() raises:
    var window = fltk_create_window_new(1000, 500, "Window".as_bytes())
    var grid = fltk_layout_grid(0, 0, get_width(window), get_height(window))
    # fltk_set_grid_layout_dimensions(grid, 10, 5, -1, 10)
    set_widget_color(grid, rgb_to_i32(77, 0, 42))


    var string = "Submit".as_bytes()
    var input = fltk_create_input_new(450, 225, 150, 25, ''.as_bytes())
    var button2 = fltk_create_button_new(450, 280, 150, 35, string)
    set_widget_color(button2, rgb_to_i32(255, 166, 214))
    set_selection_color(button2, rgb_to_i32(250, 152, 204))
    app.addEventListener(100000, pnt)
    app.setElementById(110002, input)

    # set_selection_color(input, rgb_to_i32(250, 152, 204))
   
    # fltk_grid_assign_pos(grid, input, 4, 2)
    # fltk_grid_assign_pos(grid, button2, 5, 2)

    # end_widget_child_append(window)

    show_widget(window)
    
    
    app.execute(input)


