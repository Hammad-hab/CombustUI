from .dll import __dll
from .function_definations import *
from ..types import *


var fltk_create_window_new = __dll.get_function[DEFINATION_FLTK_CREATE_WINDOW_NEW]('fltk_create_window_new')
var fltk_create_button_new = __dll.get_function[DEFINATION_FLTK_CREATE_BUTTON_NEW]("fltk_create_button_new")
var fltk_create_input_new = __dll.get_function[DEFINATION_FLTK_CREATE_INPUT_NEW]("fltk_create_input_new")
var fltk_layout_grid = __dll.get_function[DEFINATION_FLTK_LAYOUT_GRID]("fltk_layout_grid")
var fltk_create_empty = __dll.get_function[DEFINATION_FLTK_CREATE_EMPTY]("fltk_create_empty")
var fltk_layout_flex = __dll.get_function[DEFINATION_FLTK_LAYOUT_FLEX]("fltk_layout_flex")
var fltk_set_grid_layout_dimensions = __dll.get_function[DEFINATION_FLTK_SET_GRID_LAYOUT_DIMENSIONS]("fltk_set_grid_layout_dimensions")
var get_input_value = __dll.get_function[DEFINATION_GET_INPUT_VALUE]('get_input_value')
var fltk_create_image = __dll.get_function[DEFINATION_FLTK_CREATE_IMAGE]('fltk_create_image')
var message_dialog = __dll.get_function[DEFINATION_MESSAGE_DIALOG]('msg_dialog_bx')