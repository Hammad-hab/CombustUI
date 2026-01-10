"""Auto generated using maplib"""

from .dll import init
from ..types import *

alias MJUIGRABEVENT_DEFINATION= fn() -> Int
alias MJUISHOWWIDGET_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> c_void
alias MJUIHIDEWIDGET_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> c_void
alias MJUIREDRAW_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> c_void
alias MJUISETWIDGETCOLOR_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, color: UInt32) -> c_void
alias MJUISETWIDGETTEXTCOLOR_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, color: UInt32) -> c_void
alias MJUISETWIDGETSELECTIONCOLOR_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, color: UInt32) -> c_void
alias MJUISETWIDGETBOX_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, box: Int) -> c_void
alias MJUISETWIDGETLABEL_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> c_void
alias BEGIN_WIDGET_APPEND_DEFINATION= fn(group: FLTK_WIDGET_POINTER) -> c_void
alias END_WIDGET_APPEND_DEFINATION= fn(group: FLTK_WIDGET_POINTER) -> c_void
alias MJUIGETWIDGETHEIGHT_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> Int
alias MJUIGETWIDGETWIDTH_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> Int
alias MJUIWINDOWSETRESIZABLE_DEFINATION= fn(window: FLTK_WIDGET_POINTER, widget: FLTK_WIDGET_POINTER) -> c_void
alias MJUIAPPLYIMAGE_DEFINATION= fn(widget: FLTK_WIDGET_POINTER, image: Int32) -> c_void
alias MJUIIMAGESCALE_DEFINATION= fn(img: Int32, width: Int, height: Int, proportional: Int) -> c_void
alias MJUITAKEFOCUS_DEFINATION= fn(widget: FLTK_WIDGET_POINTER) -> c_void
alias USESCHEME_DEFINATION= fn(scheme: Int) -> c_void
alias FL_EXECUTE_DEFINATION= fn() -> c_void
alias FL_CHECK_DEFINATION= fn() -> Int
alias FL_READY_DEFINATION= fn() -> Int
alias MJUIEVENTKEY_DEFINATION= fn() -> Int
alias MJUICREATEBUTTON_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int, id: Int32, label_r: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICREATECHECKBUTTON_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int, id: Int32, label_r: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICHECKBUTTONGETSTATE_DEFINATION= fn(checkButton: FLTK_WIDGET_POINTER) -> Int
alias MJUICREATEINPUT_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int, id: Int32, numOnly: Int, label_r: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICREATEMULTILINEINPUT_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int, id: Int32, label_r: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUICREATECHOICE_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int) -> FLTK_WIDGET_POINTER
alias MJUISETINPUTVALUE_DEFINATION= fn(input: FLTK_WIDGET_POINTER, value: StringBytes) -> c_void
alias MJUIGRABINPUT_DEFINATION= fn(ptr: FLTK_WIDGET_POINTER) -> StringBytes
alias MJUIGRABCHOICE_DEFINATION= fn(ptr: FLTK_WIDGET_POINTER) -> Int
alias MJUIADDOPTIONTOCHOICE_DEFINATION= fn(input: FLTK_WIDGET_POINTER, choice: StringBytes) -> c_void
alias MJUISETINPUTPOSITION_DEFINATION= fn(input: FLTK_WIDGET_POINTER, pos: Int) -> c_void
alias MJUIGETINPUTPOSITION_DEFINATION= fn(input: FLTK_WIDGET_POINTER) -> Int
alias MJUICREATELABEL_DEFINATION= fn(x: Int, y: Int, width: Int, height: Int, id: Int, text: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUISETTEXTPROPERTIES_DEFINATION= fn(label: FLTK_WIDGET_POINTER, size: Int, color: UInt32, type: Int) -> c_void
alias MJUITEXTALIGN_DEFINATION= fn(label: FLTK_WIDGET_POINTER, alignment: Int) -> c_void
alias MJUILOADIMG_DEFINATION= fn(width: Int, height: Int, imgType: Int, path: StringBytes) -> Int32
alias MJUISCROLLCONTAINER_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int) -> FLTK_WIDGET_POINTER
alias MJUISCROLLSETBARBGCOLOR_DEFINATION= fn(s: FLTK_WIDGET_POINTER, c: UInt32, sbar: Int) -> c_void
alias MJUISCROLLSETBARFGCOLOR_DEFINATION= fn(s: FLTK_WIDGET_POINTER, c: UInt32, sbar: Int) -> c_void
alias MJUISCROLLBY_DEFINATION= fn(s: FLTK_WIDGET_POINTER, x: Int, y: Int) -> c_void
alias MJUICREATELAYOUTFLEX_DEFINATION= fn(x: Int, y: Int, w: Int, h: Int, dir: Int) -> FLTK_WIDGET_POINTER
alias MJUISETFLEXRESIZE_DEFINATION= fn(l: FLTK_WIDGET_POINTER, r: Int) -> c_void
alias MJUISETFLEXMARGINGAPSETTINGS_DEFINATION= fn(l: FLTK_WIDGET_POINTER, margin: Int, gap: Int) -> c_void
alias MJUISETFLEX_DEFINATION= fn(l: FLTK_WIDGET_POINTER, w: FLTK_WIDGET_POINTER, span: Int) -> c_void
alias MJUISETMARGINEXPLICIT_DEFINATION= fn(l: FLTK_WIDGET_POINTER, left: Int, top: Int, right: Int, bottom: Int) -> c_void
alias MJUIFLEXCALCULATELAYOUT_DEFINATION= fn(l: FLTK_WIDGET_POINTER) -> c_void
alias MJUICREATEWINDOW_DEFINATION= fn(width: Int, height: Int, resize: Int, fullscreen: Int, no_border: Int, title_r: StringBytes) -> FLTK_WIDGET_POINTER
alias MJUIWINDOWTITLESET_DEFINATION= fn(window: FLTK_WIDGET_POINTER, new_title_r: StringBytes) -> c_void
alias MJUIWINDOWVISIBILITYSTATUS_DEFINATION= fn(window: FLTK_WIDGET_POINTER, condition: Int) -> Int
alias MJUIWINDOWPOSITIONSET_DEFINATION= fn(window: FLTK_WIDGET_POINTER, x: Int, y: Int) -> c_void


struct CombustUIContext:
    var GrabEvent: MJUIGRABEVENT_DEFINATION
    var ShowWidget: MJUISHOWWIDGET_DEFINATION
    var HideWidget: MJUIHIDEWIDGET_DEFINATION
    var Redraw: MJUIREDRAW_DEFINATION
    var SetWidgetColor: MJUISETWIDGETCOLOR_DEFINATION
    var SetWidgetTextColor: MJUISETWIDGETTEXTCOLOR_DEFINATION
    var SetWidgetSelectionColor: MJUISETWIDGETSELECTIONCOLOR_DEFINATION
    var SetWidgetBox: MJUISETWIDGETBOX_DEFINATION
    var SetWidgetLabel: MJUISETWIDGETLABEL_DEFINATION
    var BEGIN_WIDGET_APPEND: BEGIN_WIDGET_APPEND_DEFINATION
    var END_WIDGET_APPEND: END_WIDGET_APPEND_DEFINATION
    var GetWidgetHeight: MJUIGETWIDGETHEIGHT_DEFINATION
    var GetWidgetWidth: MJUIGETWIDGETWIDTH_DEFINATION
    var WindowSetResizable: MJUIWINDOWSETRESIZABLE_DEFINATION
    var ApplyImage: MJUIAPPLYIMAGE_DEFINATION
    var ImageScale: MJUIIMAGESCALE_DEFINATION
    var TakeFocus: MJUITAKEFOCUS_DEFINATION
    var useScheme: USESCHEME_DEFINATION
    var fl_execute: FL_EXECUTE_DEFINATION
    var fl_check: FL_CHECK_DEFINATION
    var fl_ready: FL_READY_DEFINATION
    var EventKey: MJUIEVENTKEY_DEFINATION
    var CreateButton: MJUICREATEBUTTON_DEFINATION
    var CreateCheckButton: MJUICREATECHECKBUTTON_DEFINATION
    var CheckButtonGetState: MJUICHECKBUTTONGETSTATE_DEFINATION
    var CreateInput: MJUICREATEINPUT_DEFINATION
    var CreateMultilineInput: MJUICREATEMULTILINEINPUT_DEFINATION
    var CreateChoice: MJUICREATECHOICE_DEFINATION
    var SetInputValue: MJUISETINPUTVALUE_DEFINATION
    var GrabInput: MJUIGRABINPUT_DEFINATION
    var GrabChoice: MJUIGRABCHOICE_DEFINATION
    var AddOptionToChoice: MJUIADDOPTIONTOCHOICE_DEFINATION
    var SetInputPosition: MJUISETINPUTPOSITION_DEFINATION
    var GetInputPosition: MJUIGETINPUTPOSITION_DEFINATION
    var CreateLabel: MJUICREATELABEL_DEFINATION
    var SetTextProperties: MJUISETTEXTPROPERTIES_DEFINATION
    var TextAlign: MJUITEXTALIGN_DEFINATION
    var LoadImg: MJUILOADIMG_DEFINATION
    var ScrollContainer: MJUISCROLLCONTAINER_DEFINATION
    var ScrollSetBarBGColor: MJUISCROLLSETBARBGCOLOR_DEFINATION
    var ScrollSetBarFGColor: MJUISCROLLSETBARFGCOLOR_DEFINATION
    var ScrollBy: MJUISCROLLBY_DEFINATION
    var CreateLayoutFlex: MJUICREATELAYOUTFLEX_DEFINATION
    var SetFlexResize: MJUISETFLEXRESIZE_DEFINATION
    var SetFlexMarginGapSettings: MJUISETFLEXMARGINGAPSETTINGS_DEFINATION
    var SetFlex: MJUISETFLEX_DEFINATION
    var SetMarginExplicit: MJUISETMARGINEXPLICIT_DEFINATION
    var FlexCalculateLayout: MJUIFLEXCALCULATELAYOUT_DEFINATION
    var CreateWindow: MJUICREATEWINDOW_DEFINATION
    var WindowTitleSet: MJUIWINDOWTITLESET_DEFINATION
    var WindowVisibilityStatus: MJUIWINDOWVISIBILITYSTATUS_DEFINATION
    var WindowPositionSet: MJUIWINDOWPOSITIONSET_DEFINATION

    def __init__(out self):
        var __dll = init()

        self.GrabEvent = __dll.get_function[MJUIGRABEVENT_DEFINATION]("mjuiGrabEvent")
        self.ShowWidget = __dll.get_function[MJUISHOWWIDGET_DEFINATION]("mjuiShowWidget")
        self.HideWidget = __dll.get_function[MJUIHIDEWIDGET_DEFINATION]("mjuiHideWidget")
        self.Redraw = __dll.get_function[MJUIREDRAW_DEFINATION]("mjuiRedraw")
        self.SetWidgetColor = __dll.get_function[MJUISETWIDGETCOLOR_DEFINATION]("mjuiSetWidgetColor")
        self.SetWidgetTextColor = __dll.get_function[MJUISETWIDGETTEXTCOLOR_DEFINATION]("mjuiSetWidgetTextColor")
        self.SetWidgetSelectionColor = __dll.get_function[MJUISETWIDGETSELECTIONCOLOR_DEFINATION]("mjuiSetWidgetSelectionColor")
        self.SetWidgetBox = __dll.get_function[MJUISETWIDGETBOX_DEFINATION]("mjuiSetWidgetBox")
        self.SetWidgetLabel = __dll.get_function[MJUISETWIDGETLABEL_DEFINATION]("mjuiSetWidgetLabel")
        self.BEGIN_WIDGET_APPEND = __dll.get_function[BEGIN_WIDGET_APPEND_DEFINATION]("BEGIN_WIDGET_APPEND")
        self.END_WIDGET_APPEND = __dll.get_function[END_WIDGET_APPEND_DEFINATION]("END_WIDGET_APPEND")
        self.GetWidgetHeight = __dll.get_function[MJUIGETWIDGETHEIGHT_DEFINATION]("mjuiGetWidgetHeight")
        self.GetWidgetWidth = __dll.get_function[MJUIGETWIDGETWIDTH_DEFINATION]("mjuiGetWidgetWidth")
        self.WindowSetResizable = __dll.get_function[MJUIWINDOWSETRESIZABLE_DEFINATION]("mjuiWindowSetResizable")
        self.ApplyImage = __dll.get_function[MJUIAPPLYIMAGE_DEFINATION]("mjuiApplyImage")
        self.ImageScale = __dll.get_function[MJUIIMAGESCALE_DEFINATION]("mjuiImageScale")
        self.TakeFocus = __dll.get_function[MJUITAKEFOCUS_DEFINATION]("mjuiTakeFocus")
        self.useScheme = __dll.get_function[USESCHEME_DEFINATION]("useScheme")
        self.fl_execute = __dll.get_function[FL_EXECUTE_DEFINATION]("fl_execute")
        self.fl_check = __dll.get_function[FL_CHECK_DEFINATION]("fl_check")
        self.fl_ready = __dll.get_function[FL_READY_DEFINATION]("fl_ready")
        self.EventKey = __dll.get_function[MJUIEVENTKEY_DEFINATION]("mjuiEventKey")
        self.CreateButton = __dll.get_function[MJUICREATEBUTTON_DEFINATION]("mjuiCreateButton")
        self.CreateCheckButton = __dll.get_function[MJUICREATECHECKBUTTON_DEFINATION]("mjuiCreateCheckButton")
        self.CheckButtonGetState = __dll.get_function[MJUICHECKBUTTONGETSTATE_DEFINATION]("mjuiCheckButtonGetState")
        self.CreateInput = __dll.get_function[MJUICREATEINPUT_DEFINATION]("mjuiCreateInput")
        self.CreateMultilineInput = __dll.get_function[MJUICREATEMULTILINEINPUT_DEFINATION]("mjuiCreateMultilineInput")
        self.CreateChoice = __dll.get_function[MJUICREATECHOICE_DEFINATION]("mjuiCreateChoice")
        self.SetInputValue = __dll.get_function[MJUISETINPUTVALUE_DEFINATION]("mjuiSetInputValue")
        self.GrabInput = __dll.get_function[MJUIGRABINPUT_DEFINATION]("mjuiGrabInput")
        self.GrabChoice = __dll.get_function[MJUIGRABCHOICE_DEFINATION]("mjuiGrabChoice")
        self.AddOptionToChoice = __dll.get_function[MJUIADDOPTIONTOCHOICE_DEFINATION]("mjuiAddOptionToChoice")
        self.SetInputPosition = __dll.get_function[MJUISETINPUTPOSITION_DEFINATION]("mjuiSetInputPosition")
        self.GetInputPosition = __dll.get_function[MJUIGETINPUTPOSITION_DEFINATION]("mjuiGetInputPosition")
        self.CreateLabel = __dll.get_function[MJUICREATELABEL_DEFINATION]("mjuiCreateLabel")
        self.SetTextProperties = __dll.get_function[MJUISETTEXTPROPERTIES_DEFINATION]("mjuiSetTextProperties")
        self.TextAlign = __dll.get_function[MJUITEXTALIGN_DEFINATION]("mjuiTextAlign")
        self.LoadImg = __dll.get_function[MJUILOADIMG_DEFINATION]("mjuiLoadImg")
        self.ScrollContainer = __dll.get_function[MJUISCROLLCONTAINER_DEFINATION]("mjuiScrollContainer")
        self.ScrollSetBarBGColor = __dll.get_function[MJUISCROLLSETBARBGCOLOR_DEFINATION]("mjuiScrollSetBarBGColor")
        self.ScrollSetBarFGColor = __dll.get_function[MJUISCROLLSETBARFGCOLOR_DEFINATION]("mjuiScrollSetBarFGColor")
        self.ScrollBy = __dll.get_function[MJUISCROLLBY_DEFINATION]("mjuiScrollBy")
        self.CreateLayoutFlex = __dll.get_function[MJUICREATELAYOUTFLEX_DEFINATION]("mjuiCreateLayoutFlex")
        self.SetFlexResize = __dll.get_function[MJUISETFLEXRESIZE_DEFINATION]("mjuiSetFlexResize")
        self.SetFlexMarginGapSettings = __dll.get_function[MJUISETFLEXMARGINGAPSETTINGS_DEFINATION]("mjuiSetFlexMarginGapSettings")
        self.SetFlex = __dll.get_function[MJUISETFLEX_DEFINATION]("mjuiSetFlex")
        self.SetMarginExplicit = __dll.get_function[MJUISETMARGINEXPLICIT_DEFINATION]("mjuiSetMarginExplicit")
        self.FlexCalculateLayout = __dll.get_function[MJUIFLEXCALCULATELAYOUT_DEFINATION]("mjuiFlexCalculateLayout")
        self.CreateWindow = __dll.get_function[MJUICREATEWINDOW_DEFINATION]("mjuiCreateWindow")
        self.WindowTitleSet = __dll.get_function[MJUIWINDOWTITLESET_DEFINATION]("mjuiWindowTitleSet")
        self.WindowVisibilityStatus = __dll.get_function[MJUIWINDOWVISIBILITYSTATUS_DEFINATION]("mjuiWindowVisibilityStatus")
        self.WindowPositionSet = __dll.get_function[MJUIWINDOWPOSITIONSET_DEFINATION]("mjuiWindowPositionSet")
