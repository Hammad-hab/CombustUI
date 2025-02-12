from .utils import rgb_to_i32, str_to_int8
from sys.ffi import DLHandle, UnsafePointer, c_char
from memory.pointer import Pointer
from .const import *
from .types import *

var __dll = DLHandle('/Users/hammad/Documents/Hammad/Mojo/mojo-ui/mjui/libc/fltk.dylib')



# Main functionality
var show_widget = __dll.get_function[fn(w: FLTK_WIDGET_POINTER) -> c_void]('show_widget')
var fltk_exec = __dll.get_function[fn() -> c_void]('fltk_execute')
var end_widget_child_append = __dll.get_function[fn(widget: FLTK_WIDGET_POINTER) -> c_void]('end_widget_child_append')
var begin_widget_child_append = __dll.get_function[fn(widget: FLTK_WIDGET_POINTER) -> c_void]('begin_widget_child_append')
var fltk_grid_assign_pos = __dll.get_function[fn(grid: FLTK_WIDGET_POINTER, widget: FLTK_WIDGET_POINTER, row:Int32, col:Int32) -> c_void]('fltk_grid_assign_pos')
var set_widget_color = __dll.get_function[fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void]('set_widget_color')
var set_text_color = __dll.get_function[fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void]('set_text_color')
var set_selection_color = __dll.get_function[fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void]('set_widget_color2')
var get_height = __dll.get_function[fn(w: FLTK_WIDGET_POINTER) -> Int32]('get_height')
var get_width = __dll.get_function[fn(w: FLTK_WIDGET_POINTER) -> Int32]('get_width')
var set_cursor = __dll.get_function[fn(window: FLTK_WIDGET_POINTER, cursor:UInt32) -> NoneType]('set_window_cursor')
var set_id = __dll.get_function[fn(widget: FLTK_WIDGET_POINTER, id:Int) -> NoneType]('set_id')
var set_widget_callback = __dll.get_function[fn(w: FLTK_WIDGET_POINTER, handler:UnsafePointer[fn(w: FLTK_WIDGET_POINTER, *args:c_void)->NoneType, alignment=1]) -> NoneType]('set_widget_callback')
var fl_ready = __dll.get_function[fn() -> Int32]('fltk_check')
var fl_check = __dll.get_function[fn() -> Int32]('fltk_ready')


# Widgets
var fltk_create_window_new = __dll.get_function[fn(w: UInt32, h:UInt32, l:StringBytes) -> FLTK_WIDGET_POINTER]('fltk_create_window_new')
var fltk_create_button_new = __dll.get_function[fn(x:Int32, y:Int32, w:Int32, h:Int32, l:StringBytes) -> FLTK_WIDGET_POINTER]("fltk_create_button_new")
var fltk_create_input_new = __dll.get_function[fn(x:Int32, y:Int32, w:Int32, h:Int32, l:StringBytes) -> FLTK_WIDGET_POINTER]("fltk_create_input_new")
var fltk_layout_grid = __dll.get_function[fn(x:Int32, y:Int32, w:Int32, h:Int32) -> FLTK_WIDGET_POINTER]("fltk_layout_grid")
var fltk_set_grid_layout_dimensions = __dll.get_function[fn(grid: FLTK_WIDGET_POINTER, rows:Int32, cols:Int32, margin:Int32, gap:Int32) -> c_void]("fltk_set_grid_layout_dimensions")
var grabEventFromFLTK = __dll.get_function[fn() -> Int]('listEvents')
var get_input_value = __dll.get_function[fn(input: FLTK_WIDGET_POINTER) -> StringBytes]('get_input_value')
var fltk_create_image = __dll.get_function[fn(path: StringBytes) -> FLTK_WIDGET_POINTER]('fltk_create_image')



struct Color:
    
    var red: UInt32
    var green: UInt32
    var blue: UInt32
    var _color: UInt32

    fn __init__(mut self, r:UInt32, g:UInt32, b:UInt32):
        self.red = r
        self.green = g
        self.blue = b
        self._color = 0
        _ = self._compile_color()

    fn _compile_color(mut self) -> UInt32:
        self._color = rgb_to_i32(self.red, self.green, self.blue)
        return self._color

    fn getColor(mut self) -> UInt32:
        return self._color

    @staticmethod
    fn assignColorTo(widget:FLTK_WIDGET_POINTER, owned color: Color,):
        var clr = color.getColor()
        set_widget_color(widget, clr)

    @staticmethod
    fn assignSelectionColorTo(widget: FLTK_WIDGET_POINTER, owned color: Color):
        var clr = color.getColor()
        set_selection_color(widget, clr)

