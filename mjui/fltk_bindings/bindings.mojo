"""Auto generated using generator.py"""


from .dll import __dll
from ..types import *

alias MJUIWINDOWSETRESIZABLE_DEFINATION= fn(window: FLTK_WIDGET_POINTER, widgit: FLTK_WIDGET_POINTER) -> c_void
alias MJUIFLEXCALCULATELAYOUT_DEFINATION= fn(layout: FLTK_WIDGET_POINTER) -> c_void
alias MJUISETFLEXRESIZE_DEFINATION= fn(layout: FLTK_WIDGET_POINTER, direction: Int) -> c_void
alias FL_READY_DEFINATION= fn() -> Int32
alias FL_CHECK_DEFINATION= fn() -> Int32
alias MJUISHOWWIDGET_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> c_void
alias MJUILOADIMAGE_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, file: StringBytes) -> c_void
alias MJUIWIDGETCOLOR_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, colour: UInt32) -> c_void
alias MJUIWIDGETTEXTCOLOR_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, colour: UInt32) -> c_void
alias MJUISETSELECTIONCOLOR_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, colour: UInt32) -> c_void
alias GRAB_FLTK_EVENT_DEFINATION= fn() -> Int
alias MJUISPAWNWINDOW_DEFINATION= fn(w: Int32, h: Int32, resize: Int, no_border: Int, fullscreen: Int, label: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICREATELABEL_DEFINATION= fn(x: Int32, y: Int32, w: Int32, h: Int32, label: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICREATEBUTTON_DEFINATION= fn(x: Int32, y: Int32, w: Int32, h: Int32, id: Int32, label: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICREATEINPUT_DEFINATION= fn(x: Int32, y: Int32, w: Int32, h: Int32, id: Int32, label: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUIGRABINPUT_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> StringBytes
alias MJUISETTEXTPROPERTIES_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, size: Int32, colour: UInt32) -> c_void
alias MJUISETWIDGETLABEL_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, title: StringBytes) -> c_void
alias MJUISETWINDOWTITLE_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, title: StringBytes) -> c_void
alias MJUIWINDOWVISIBILITYSTATUS_DEFINATION= fn(window: FLTK_WIDGET_POINTER, condition: Int) -> Int
alias MJUICREATELAYOUTFLEX_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int, dir: Int) -> FLTK_WIDGET_POINTER
alias END_WIDGET_APPEND_DEFINATION= fn(w: FLTK_WIDGET_POINTER) -> c_void
alias BEGIN_WIDGET_APPEND_DEFINATION= fn(w: FLTK_WIDGET_POINTER) -> c_void
alias MJUISETWIDGETID_BUTTON_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, id: Int) -> c_void

var mjuiWindowSetResizable = __dll.get_function[MJUIWINDOWSETRESIZABLE_DEFINATION]("mjuiWindowSetResizable")
var mjuiFlexCalculateLayout = __dll.get_function[MJUIFLEXCALCULATELAYOUT_DEFINATION]("mjuiFlexCalculateLayout")
var mjuiSetFlexResize = __dll.get_function[MJUISETFLEXRESIZE_DEFINATION]("mjuiSetFlexResize")
var fl_ready = __dll.get_function[FL_READY_DEFINATION]("fltk_check")
var fl_check = __dll.get_function[FL_CHECK_DEFINATION]("fltk_check")
var mjuiShowWidget = __dll.get_function[MJUISHOWWIDGET_DEFINATION]("show_widget")
var mjuiLoadImage = __dll.get_function[MJUILOADIMAGE_DEFINATION]("load_img")
var mjuiWidgetColor = __dll.get_function[MJUIWIDGETCOLOR_DEFINATION]("set_widget_color")
var mjuiWidgetTextColor = __dll.get_function[MJUIWIDGETTEXTCOLOR_DEFINATION]("set_text_color")
var mjuiSetSelectionColor = __dll.get_function[MJUISETSELECTIONCOLOR_DEFINATION]("set_widget_color2")
var grab_fltk_event = __dll.get_function[GRAB_FLTK_EVENT_DEFINATION]("listEvents")
var mjuiSpawnWindow = __dll.get_function[MJUISPAWNWINDOW_DEFINATION]("mjuiCreateWindow")
var mjuiCreateLabel = __dll.get_function[MJUICREATELABEL_DEFINATION]("mjuiCreateLabel")
var mjuiCreateButton = __dll.get_function[MJUICREATEBUTTON_DEFINATION]("mjuiCreateButton")
var mjuiCreateInput = __dll.get_function[MJUICREATEINPUT_DEFINATION]("mjuiCreateInput")
var mjuiGrabInput = __dll.get_function[MJUIGRABINPUT_DEFINATION]("mjuiGrabInput")
var mjuiSetTextProperties = __dll.get_function[MJUISETTEXTPROPERTIES_DEFINATION]("mjuiSetTextProperties")
var mjuiSetWidgetLabel = __dll.get_function[MJUISETWIDGETLABEL_DEFINATION]("mjuiSetWidgetLabel")
var mjuiSetWindowTitle = __dll.get_function[MJUISETWINDOWTITLE_DEFINATION]("mjuiSetWindowTitle")
var mjuiWindowVisibilityStatus = __dll.get_function[MJUIWINDOWVISIBILITYSTATUS_DEFINATION]("mjuiWindowVisibilityStatus")
var mjuiCreateLayoutFlex = __dll.get_function[MJUICREATELAYOUTFLEX_DEFINATION]("mjuiCreateLayoutFlex")
var END_WIDGET_APPEND = __dll.get_function[END_WIDGET_APPEND_DEFINATION]("end_widget_child_append")
var BEGIN_WIDGET_APPEND = __dll.get_function[BEGIN_WIDGET_APPEND_DEFINATION]("begin_widget_child_append")
var mjuiSetWidgetId_button = __dll.get_function[MJUISETWIDGETID_BUTTON_DEFINATION]("set_id_button")