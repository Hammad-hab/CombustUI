from .._app import Application, FLTK_WIDGET_POINTER, isRunning
from ..fltk_bindings import *
from memory.pointer import Pointer
from ..fltk_bindings.dll import __dll
from ..utils import readFromStringBytes, rgb_to_i32, filter, DataStore
import os

var app = Application()
var idStore = 0
fn nextImg() raises:
    var ids: List[Int] = List[Int](100, 200, 300)
    if (idStore > 2):
        var fnalPointer = app.getElementById(ids[2])
        hide_widget(fnalPointer)
        idStore = 0
        
    var pointer = app.getElementById(ids[idStore])
    show_widget(pointer)
 

    if (idStore > 0):
        var prevImageStore = idStore - 1
        var prevPointer = app.getElementById(ids[prevImageStore])
        hide_widget(prevPointer)

    idStore += 1
    ...

fn prevImg() raises:

    var ids: List[Int] = List[Int](100, 200, 300)
    var pointer = app.getElementById(ids[idStore])
    show_widget(pointer)
    if (idStore < 0):
        idStore = 2

    if (idStore < 2):
        var prevImageStore = idStore + 1
        var prevPointer = app.getElementById(ids[prevImageStore])
        hide_widget(prevPointer)
    idStore -= 1
    ...

fn imgExample() raises:
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
    set_id(nextButton, 2000)
    set_id(prevButton, 1000)

    app.addEventListener(2000, nextImg)
    app.addEventListener(1000, prevImg)

    # var files = filter[String](os.listdir('./'), neW)
    var image1 = fltk_create_image("pallet.png".as_bytes())
    var image2 = fltk_create_image("pdf.png".as_bytes())
    var image3 = fltk_create_image("pix.png".as_bytes())
    hide_widget(image1)
    hide_widget(image2)
    hide_widget(image3)
    

    app.setElementById(100, image1)
    app.setElementById(200, image2)
    app.setElementById(300, image3)

    app.setElementById(3123, grid)


    fltk_grid_assign_pos(grid, prevButton, 9, 0)
    fltk_grid_assign_pos(grid, nextButton, 9, 4)
    show_widget(window)
    
    
    app.execute()

 
