from mjui._app import Application, FLTK_WIDGET_POINTER, isRunning
from mjui.dll import *
from memory.pointer import Pointer
from mjui.dll import __dll
from mjui.utils import readFromStringBytes

fn exitApp() raises:
    isRunning = False
    ...
    

fn main() raises:
    var app = Application()
    var window = fltk_create_window_new(1000, 500, "Window".as_bytes())
    var grid = fltk_layout_grid(0, 0, get_width(window), get_height(window))
    fltk_set_grid_layout_dimensions(grid, 10, 5, 10, 10)
    set_widget_color(grid, rgb_to_i32(255, 255, 255))

    var exitStr = "Exit".as_bytes()
    var saveStr = "Save".as_bytes()

    var exitButton = fltk_create_button_new(0, 0, 0, 0, exitStr)
    set_widget_color(exitButton, rgb_to_i32(255, 0, 0))
    set_selection_color(exitButton, rgb_to_i32(240, 82, 82))
    set_text_color(exitButton, rgb_to_i32(255, 255, 255))

    var saveButton = fltk_create_button_new(0, 0, 0, 0, saveStr)
    var img = fltk_create_image("logo.png".as_bytes())

    set_text_color(saveButton, rgb_to_i32(255, 255, 255))
    set_selection_color(saveButton, rgb_to_i32(100, 100, 100))


    set_id(exitButton, 10000)
    app.addEventListener(10000, exitApp)

    
    fltk_grid_assign_pos(grid, exitButton, 9, 0)
    fltk_grid_assign_pos(grid, saveButton, 9, 4)
    fltk_grid_assign_pos(grid, img, 5, 2)
    show_widget(window)
    
    
    app.execute()


