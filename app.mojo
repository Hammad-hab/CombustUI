from mjui._app import Application, FLTK_WIDGET_POINTER
from mjui.const import *
from memory.pointer import Pointer
from mjui.const import __dll

fn log(w: FLTK_WIDGET_POINTER, *args:c_void) -> NoneType:
    print("Jello")
    return

fn main() raises:
    var app = Application()
    var window = fltk_create_window_new(1000, 500, "Window")
    var grid = fltk_layout_grid(0, 0, get_width(window), get_height(window))
    fltk_set_grid_layout_dimensions(grid, 10, 5, -1, 10)
    set_widget_color(grid, rgb_to_i32(77, 0, 42))


    var string = "Submit".as_bytes()
    var input = fltk_create_input_new(0, 0, 0, 0, ''.as_bytes())
    var button2 = fltk_create_button_new(0, 0, 0, 0, string)
    var fn_pointer = UnsafePointer.address_of(log)

    set_widget_color(button2, rgb_to_i32(255, 166, 214))
    set_selection_color(button2, rgb_to_i32(250, 152, 204))
    set_widget_callback(button2, fn_pointer)

    fltk_grid_assign_pos(grid, input, 4, 2)
    fltk_grid_assign_pos(grid, button2, 5, 2)

    end_widget_child_append(grid)
    end_widget_child_append(window)
    show_widget(window)
    app.execute()

