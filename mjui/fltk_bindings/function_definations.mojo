from ..types import FLTK_WIDGET_POINTER, c_void, UnsafePointer


alias DEFINATION_SHOW_WIDGET = fn(w: FLTK_WIDGET_POINTER) -> c_void
alias DEFINATION_EXECUTE = fn() -> c_void
alias DEFINATION_END_WIDGET_CHILD_APPEND = fn(w: FLTK_WIDGET_POINTER) -> c_void
alias DEFINATION_BEGIN_WIDGET_CHILD_APPEND =  fn(w: FLTK_WIDGET_POINTER) -> c_void
alias DEFINATION_GRID_ASSIGN_POS = fn(grid: FLTK_WIDGET_POINTER, widget: FLTK_WIDGET_POINTER, row:Int32, col:Int32) -> c_void
alias DEFINATION_SET_WIDGET_COLOR = fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void
alias DEFINATION_SET_TEXT_COLOR = fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void
alias DEFINATION_SET_SELECTION_COLOR = fn(w: FLTK_WIDGET_POINTER, c: UInt32) -> c_void
alias DEFINATION_GET_HEIGHT = fn(w: FLTK_WIDGET_POINTER) -> Int32
alias DEFINATION_GET_WIDTH = fn(w: FLTK_WIDGET_POINTER) -> Int32
alias DEFINATION_SET_CURSOR = fn(w: FLTK_WIDGET_POINTER, cursor:UInt32) -> NoneType
alias DEFINATION_SET_ID = fn(w: FLTK_WIDGET_POINTER, id:Int) -> NoneType
alias DEFINATION_SET_WIDGET_CALLBACK = fn(w: FLTK_WIDGET_POINTER, handler:UnsafePointer[fn(w: FLTK_WIDGET_POINTER, *args:c_void)->NoneType, alignment=1]) -> NoneType
alias DEFINATION_FL_READY = fn() -> Int32
alias DEFINATION_FL_CHECK = fn() -> Int32
alias DEFINATION_FLTK_CREATE_WINDOW_NEW = fn(w: UInt32, h:UInt32, l:StringBytes) -> FLTK_WIDGET_POINTER
alias DEFINATION_FLTK_CREATE_BUTTON_NEW = fn(x:Int32, y:Int32, w:Int32, h:Int32, l:StringBytes) -> FLTK_WIDGET_POINTER
alias DEFINATION_FLTK_CREATE_INPUT_NEW = fn(x:Int32, y:Int32, w:Int32, h:Int32, l:StringBytes) -> FLTK_WIDGET_POINTER
alias DEFINATION_FLTK_LAYOUT_GRID = fn(x:Int32, y:Int32, w:Int32, h:Int32) -> FLTK_WIDGET_POINTER
alias DEFINATION_FLTK_SET_GRID_LAYOUT_DIMENSIONS = fn(grid: FLTK_WIDGET_POINTER, rows:Int32, cols:Int32, margin:Int32, gap:Int32) -> c_void
alias DEFINATION_GRAB_EVENT_FROM_FLTK = fn() -> Int
alias DEFINATION_GET_INPUT_VALUE = fn(input: FLTK_WIDGET_POINTER) -> StringBytes
alias DEFINATION_FLTK_CREATE_IMAGE = fn(path: StringBytes) -> FLTK_WIDGET_POINTER
