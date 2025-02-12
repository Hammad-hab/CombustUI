from mjui._app import Application, FLTK_WIDGET_POINTER, isRunning
from mjui.fltk_bindings import *
from memory.pointer import Pointer
from mjui.fltk_bindings.dll import __dll
from mjui.utils import readFromStringBytes, rgb_to_i32

fn prevApp() raises:
    ...
    

fn main() raises:
    var app = Application()
    var window = fltk_create_window_new(1000, 500, "Img Viewer".as_bytes())
    var grid = fltk_layout_grid(0, 0, get_width(window), get_height(window))
    fltk_set_grid_layout_dimensions(grid, 10, 5, 10, 10)
    set_widget_color(grid, rgb_to_i32(255, 255, 255))

    var prevStr = "Previous".as_bytes()
    var nextStr = "Next".as_bytes()

    var prevButton = fltk_create_button_new(0, 0, 0, 0, prevStr)
    set_widget_color(prevButton, rgb_to_i32(255, 0, 0))
    set_selection_color(prevButton, rgb_to_i32(240, 82, 82))
    set_text_color(prevButton, rgb_to_i32(255, 255, 255))

    var nextButton = fltk_create_button_new(0, 0, 0, 0, nextStr)
    set_widget_color(nextButton, rgb_to_i32(4, 0, 255))
    set_selection_color(nextButton, rgb_to_i32(82, 82, 240))
    set_text_color(nextButton, rgb_to_i32(255, 255, 255))


    var image = fltk_create_image('logo.png'.as_bytes(), 10000, 10000)
    fltk_grid_assign_pos(grid, prevButton, 9, 0)
    fltk_grid_assign_pos(grid, nextButton, 9, 4)
    fltk_grid_assign_pos(grid, image, 0, 0)
    show_widget(window)
    
    
    app.execute()


