from sys.ffi import DLHandle, UnsafePointer, c_char
from collections import Dict
from memory import Span

alias FLTK_POINTER = fn() -> Int32
alias FLTK_WIDGET_POINTER = UnsafePointer[FLTK_POINTER]
alias c_void = NoneType
alias StringBytes  = Span[Int8, StaticConstantOrigin]