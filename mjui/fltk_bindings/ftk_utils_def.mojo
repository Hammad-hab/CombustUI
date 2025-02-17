from .dll import __dll
from ..types import FLTK_WIDGET_POINTER, c_void, UnsafePointer
from .function_definations import *

var show_widget = __dll.get_function[DEFINATION_SHOW_WIDGET]('show_widget')
var hide_widget = __dll.get_function[DEFINATION_SHOW_WIDGET]('hide_widget')
var fltk_exec = __dll.get_function[DEFINATION_EXECUTE]('fltk_execute')
var end_widget_child_append = __dll.get_function[DEFINATION_END_WIDGET_CHILD_APPEND]('end_widget_child_append')
var begin_widget_child_append = __dll.get_function[DEFINATION_BEGIN_WIDGET_CHILD_APPEND]('begin_widget_child_append')
var fltk_grid_assign_pos = __dll.get_function[DEFINATION_GRID_ASSIGN_POS]('fltk_grid_assign_pos')
var set_widget_color = __dll.get_function[DEFINATION_SET_WIDGET_COLOR]('set_widget_color')
var set_text_color = __dll.get_function[DEFINATION_SET_TEXT_COLOR]('set_text_color')
var set_selection_color = __dll.get_function[DEFINATION_SET_SELECTION_COLOR]('set_widget_color2')
var get_height = __dll.get_function[DEFINATION_GET_HEIGHT]('get_height')
var get_width = __dll.get_function[DEFINATION_GET_WIDTH]('get_width')
var set_cursor = __dll.get_function[DEFINATION_SET_CURSOR]('set_window_cursor')
var set_id = __dll.get_function[DEFINATION_SET_ID]('set_id')
var set_widget_callback = __dll.get_function[DEFINATION_SET_WIDGET_CALLBACK]('set_widget_callback')
var fl_ready = __dll.get_function[DEFINATION_FL_READY]('fltk_check')
var fl_check = __dll.get_function[DEFINATION_FL_CHECK]('fltk_ready')
var grab_fltk_event = __dll.get_function[DEFINATION_GRAB_EVENT_FROM_FLTK]('listEvents')
var set_label = __dll.get_function[DEFINATION_SET_LABEL]('set_label')
