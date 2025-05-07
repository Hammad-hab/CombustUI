from collections import Dict

alias MJUI_CURSOR_DEFAULT = 0
alias MJUI_CURSOR_ARROW = 35
alias MJUI_CURSOR_CROSS = 66
alias MJUI_CURSOR_WAIT = 76
alias MJUI_CURSOR_INSERT = 77
alias MJUI_CURSOR_HAND = 31
alias MJUI_CURSOR_HELP = 47
alias MJUI_CURSOR_MOVE = 27
alias MJUI_CURSOR_NS = 78
alias MJUI_CURSOR_WE = 79
alias MJUI_CURSOR_NWSE = 80
alias MJUI_CURSOR_NESW = 81
alias MJUI_CURSOR_N = 70
alias MJUI_CURSOR_NE = 69
alias MJUI_CURSOR_E = 49
alias MJUI_CURSOR_SE = 8
alias MJUI_CURSOR_S = 9
alias MJUI_CURSOR_SW = 7
alias MJUI_CURSOR_W = 36
alias MJUI_CURSOR_NW = 68
alias MJUI_CURSOR_NONE = 255

alias MJUI_NO_EVENT                    = 0
alias MJUI_PUSH                        = 1
alias MJUI_RELEASE                     = 2
alias MJUI_ENTER                       = 3
alias MJUI_LEAVE                       = 4
alias MJUI_DRAG                        = 5
alias MJUI_FOCUS                       = 6
alias MJUI_UNFOCUS                     = 7
alias MJUI_KEYDOWN                     = 8
alias MJUI_KEYBOARD                    = 8
alias MJUI_KEYUP                       = 9
alias MJUI_CLOSE                       = 10
alias MJUI_MOVE                        = 11
alias MJUI_SHORTCUT                    = 12
alias MJUI_DEACTIVATE                  = 13
alias MJUI_ACTIVATE                    = 14
alias MJUI_HIDE                        = 15
alias MJUI_SHOW                        = 16
alias MJUI_PASTE                       = 17
alias MJUI_SELECTIONCLEAR              = 18
alias MJUI_MOUSEWHEEL                  = 19
alias MJUI_DND_ENTER                   = 20
alias MJUI_DND_DRAG                    = 21
alias MJUI_DND_LEAVE                   = 22
alias MJUI_DND_RELEASE                 = 23
alias MJUI_SCREEN_CONFIGURATION_CHANGED = 24
alias MJUI_FULLSCREEN                  = 25
alias MJUI_ZOOM_GESTURE                = 26
alias MJUI_ZOOM_EVENT                  = 27

alias MJUI_MJUIEX_HORIZONTAL = 1
alias MJUI_MJUIEX_VERTICAL = 0
#define RESIZE_XY 100
#define RESIZE_XONLY 110
#define RESIZE_YONLY 111

alias RESIZE_XY = 100
alias RESIZE_XONLY = 110
alias RESIZE_YONLY = 111

alias YES = 1
alias NO = 0

fn getEventNameFromNum(num: Int) -> String:
    var event_map: List[String] = List[String]("MJUI_NO_EVENT", "MJUI_PUSH", "MJUI_RELEASE", "MJUI_ENTER", "MJUI_LEAVE",
                     "MJUI_DRAG", "MJUI_FOCUS", "MJUI_UNFOCUS", "MJUI_KEYDOWN / MJUI_KEYBOARD",
                     "MJUI_KEYUP", "MJUI_CLOSE", "MJUI_MOVE", "MJUI_SHORTCUT", "MJUI_DEACTIVATE",
                     "MJUI_ACTIVATE", "MJUI_HIDE", "MJUI_SHOW", "MJUI_PASTE", "MJUI_SELECTIONCLEAR",
                     "MJUI_MOUSEWHEEL", "MJUI_DND_ENTER", "MJUI_DND_DRAG", "MJUI_DND_LEAVE",
                     "MJUI_DND_RELEASE", "MJUI_SCREEN_CONFIGURATION_CHANGED", "MJUI_FULLSCREEN",
                     "MJUI_ZOOM_GESTURE", "MJUI_ZOOM_EVENT")

    if num >= 0 and num < len(event_map):
        return event_map[num]

    return "UNKNOWN_EVENT"