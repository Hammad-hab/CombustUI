from .types import StringBytes, FLTK_WIDGET_POINTER
from collections import Optional
from memory import Span, UnsafePointer
import sys

fn rgb(r:UInt32, g:UInt32, b:UInt32) -> UInt32:
    """
        Converts rgb values to a singe 256-color pallet integer.
    """
    return UInt32(((((r << 8) | g) << 8) | b)<<8)

            
fn str_to_int8(str: String) -> List[Int8]:
    """
        Converts a string into a list of ASCII character codes.
    """
    var list = List[Int8]()
    for char in str:
        list.append(ord(char))
    
    return list

fn readFromStringBytes(bytes: StringBytes) -> String:
    var string: String = ""
    var i = 0
    while bytes._data[i] != 0:
        var data = bytes._data[i]
        string += chr(Int(data))
        i += 1
    return string


fn createIdFrom(id: String) raises -> Int:
    var strn: Int = 0
    for char in id:
       intrepr = ord(char)
       strn += intrepr
    
    return strn

@always_inline
fn convertStringToBytes(owned strn: String) -> StringBytes:
    var ptr = strn.unsafe_cstr_ptr()
    var span = Span[Int8, StaticConstantOrigin](ptr=ptr, length=strn.__len__())
    return span

alias EMPTY = convertStringToBytes("")

# Visual Schemes
alias GTK = 0
alias GLEAM = 1
alias PLASTIC = 2
