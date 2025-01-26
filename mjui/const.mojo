from .utils import rgb_to_i32, str_to_int8
from sys.ffi import DLHandle, UnsafePointer
from memory import Span
from memory.pointer import Pointer

alias FLTK_POINTER = fn() -> Int32
alias FLTK_WIDGET_POINTER = UnsafePointer[FLTK_POINTER]
alias c_void = NoneType
alias StringBytes  = Span[UInt8, StaticConstantOrigin]

var __dll = DLHandle('/Users/hammad/Documents/Hammad/Mojo/mojo-ui/mjui/libc/fltk.so')

fn dllGetFunctionSymbol[type: AnyTrivialRegType](name:String) -> type:
    return dllGetFunctionSymbol[type]('show_widget')

alias FL_CURSOR_DEFAULT = 0
alias FL_CURSOR_ARROW = 35
alias FL_CURSOR_CROSS = 66
alias FL_CURSOR_WAIT = 76
alias FL_CURSOR_INSERT = 77
alias FL_CURSOR_HAND = 31
alias FL_CURSOR_HELP = 47
alias FL_CURSOR_MOVE = 27
alias FL_CURSOR_NS = 78
alias FL_CURSOR_WE = 79
alias FL_CURSOR_NWSE = 80
alias FL_CURSOR_NESW = 81
alias FL_CURSOR_N = 70
alias FL_CURSOR_NE = 69
alias FL_CURSOR_E = 49
alias FL_CURSOR_SE = 8
alias FL_CURSOR_S = 9
alias FL_CURSOR_SW = 7
alias FL_CURSOR_W = 36
alias FL_CURSOR_NW = 68
alias FL_CURSOR_NONE = 255

# Main functionality
var show_widget = dllGetFunctionSymbol[fn(w: FLTK_WIDGET_POINTER) -> c_void]('show_widget')
var fltk_exec = dllGetFunctionSymbol[fn() -> c_void]('fltk_execute')
var end_widget_child_append = dllGetFunctionSymbol[fn(widget: FLTK_WIDGET_POINTER) -> c_void]('end_widget_child_append')
var fltk_grid_assign_pos = dllGetFunctionSymbol[fn(grid: FLTK_WIDGET_POINTER, widget: FLTK_WIDGET_POINTER, row:Int32, col:Int32) -> c_void]('fltk_grid_assign_pos')
var set_widget_color = dllGetFunctionSymbol[fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void]('set_widget_color')
var set_selection_color = dllGetFunctionSymbol[fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void]('set_widget_color2')
var get_height = dllGetFunctionSymbol[fn(w: FLTK_WIDGET_POINTER) -> Int32]('get_height')
var get_width = dllGetFunctionSymbol[fn(w: FLTK_WIDGET_POINTER) -> Int32]('get_width')
var set_cursor = dllGetFunctionSymbol[fn(window: FLTK_WIDGET_POINTER, cursor:UInt32) -> NoneType]('set_window_cursor')
var set_widget_callback = dllGetFunctionSymbol[fn(w: FLTK_WIDGET_POINTER, handler:UnsafePointer[fn(w: FLTK_WIDGET_POINTER, *args:c_void)->NoneType, alignment=1]) -> NoneType]('set_widget_callback')


# Widgets
var fltk_create_window_new = dllGetFunctionSymbol[fn(w: UInt32, h:UInt32, l:String) -> FLTK_WIDGET_POINTER]('fltk_create_window_new')
var fltk_create_button_new = dllGetFunctionSymbol[fn(x:Int32, y:Int32, w:Int32, h:Int32, l:StringBytes) -> FLTK_WIDGET_POINTER]("fltk_create_button_new")
var fltk_create_input_new = dllGetFunctionSymbol[fn(x:Int32, y:Int32, w:Int32, h:Int32, l:StringBytes) -> FLTK_WIDGET_POINTER]("fltk_create_input_new")
var fltk_layout_grid = dllGetFunctionSymbol[fn(x:Int32, y:Int32, w:Int32, h:Int32) -> FLTK_WIDGET_POINTER]("fltk_layout_grid")
var fltk_set_grid_layout_dimensions = dllGetFunctionSymbol[fn(grid: FLTK_WIDGET_POINTER, rows:Int32, cols:Int32, margin:Int32, gap:Int32) -> c_void]("fltk_set_grid_layout_dimensions")


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

