from collections import Dict

alias MJUI_NULL = -1

# Cursor Types
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

# Event Types
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


# Flex Layout Flags
alias MJUI_MJUIEX_HORIZONTAL = 1
alias MJUI_MJUIEX_VERTICAL = 0

# Flex Resize Flags
alias RESIZE_XY = 100
alias RESIZE_XONLY = 110
alias RESIZE_YONLY = 111

# Yes / No, on / off, true / false, etc.
alias YES = 1
alias NO = 0

# Label Types
alias MJUI_LABEL_TYPE_NORMAL = 0
alias MJUI_LABEL_TYPE_SHADOW = 1
alias MJUI_LABEL_TYPE_EMBOSSED = 2
alias MJUI_LABEL_TYPE_MULTI = 3
alias MJUI_LABEL_TYPE_IMAGE = 4

# Box Types
alias MJUI_NO_BOX = 0
alias MJUI_FLAT_BOX = 1
alias MJUI_UP_BOX = 2
alias MJUI_DOWN_BOX = 3
alias MJUI_UP_FRAME = 4
alias MJUI_DOWN_FRAME = 5
alias MJUI_THIN_UP_BOX = 6
alias MJUI_THIN_DOWN_BOX = 7
alias MJUI_THIN_UP_FRAME = 8
alias MJUI_THIN_DOWN_FRAME = 9
alias MJUI_ENGRAVED_BOX = 10
alias MJUI_EMBOSSED_BOX = 11
alias MJUI_ENGRAVED_FRAME = 12
alias MJUI_EMBOSSED_FRAME = 13
alias MJUI_BORDER_BOX = 14
alias MJUI_SHADOW_BOX = 15
alias MJUI_BORDER_FRAME = 16
alias MJUI_SHADOW_FRAME = 17
alias MJUI_ROUNDED_BOX = 18
alias MJUI_RSHADOW_BOX = 19
alias MJUI_ROUNDED_FRAME = 20
alias MJUI_RFLAT_BOX = 21
alias MJUI_ROUND_UP_BOX = 22
alias MJUI_ROUND_DOWN_BOX = 23
alias MJUI_DIAMOND_UP_BOX = 24
alias MJUI_DIAMOND_DOWN_BOX = 25
alias MJUI_OVAL_BOX = 26
alias MJUI_OSHADOW_BOX = 27
alias MJUI_OVAL_FRAME = 28
alias MJUI_OFLAT_BOX = 29
alias MJUI_PLASTIC_UP_BOX = 30
alias MJUI_PLASTIC_DOWN_BOX = 31
alias MJUI_PLASTIC_UP_FRAME = 32
alias MJUI_PLASTIC_DOWN_FRAME = 33
alias MJUI_PLASTIC_THIN_UP_BOX = 34
alias MJUI_PLASTIC_THIN_DOWN_BOX = 35
alias MJUI_PLASTIC_ROUND_UP_BOX = 36
alias MJUI_PLASTIC_ROUND_DOWN_BOX = 37
alias MJUI_GTK_UP_BOX = 38
alias MJUI_GTK_DOWN_BOX = 39
alias MJUI_GTK_UP_FRAME = 40
alias MJUI_GTK_DOWN_FRAME = 41
alias MJUI_GTK_THIN_UP_BOX = 42
alias MJUI_GTK_THIN_DOWN_BOX = 43
alias MJUI_GTK_THIN_UP_FRAME = 44
alias MJUI_GTK_THIN_DOWN_FRAME = 45
alias MJUI_GTK_ROUND_UP_BOX = 46
alias MJUI_GTK_ROUND_DOWN_BOX = 47
alias MJUI_GLEAM_UP_BOX = 48
alias MJUI_GLEAM_DOWN_BOX = 49
alias MJUI_GLEAM_UP_FRAME = 50
alias MJUI_GLEAM_DOWN_FRAME = 51
alias MJUI_GLEAM_THIN_UP_BOX = 52
alias MJUI_GLEAM_THIN_DOWN_BOX = 53
alias MJUI_GLEAM_ROUND_UP_BOX = 54
alias MJUI_GLEAM_ROUND_DOWN_BOX = 55
alias MJUI_OXY_UP_BOX = 56
alias MJUI_OXY_DOWN_BOX = 57
alias MJUI_OXY_UP_FRAME = 58
alias MJUI_OXY_DOWN_FRAME = 59
alias MJUI_OXY_THIN_UP_BOX = 60
alias MJUI_OXY_THIN_DOWN_BOX = 61
alias MJUI_OXY_THIN_UP_FRAME = 62
alias MJUI_OXY_THIN_DOWN_FRAME = 63
alias MJUI_OXY_ROUND_UP_BOX = 64
alias MJUI_OXY_ROUND_DOWN_BOX = 65
alias MJUI_OXY_BUTTON_UP_BOX = 66
alias MJUI_OXY_BUTTON_DOWN_BOX = 67
alias MJUI_FREE_BOXTYPE = 68
alias MJUI_MAX_BOXTYPE = 255

alias PNG = 0
alias JPEG =  1
alias SVG = 2
alias BMP = 3
alias GIF = 4
alias ANIM_GIF = 5

alias ALIGN_CENTER = 0
alias ALIGN_TOP = 1
alias ALIGN_BOTTOM = 2
alias ALIGN_LEFT = 3
alias ALIGN_RIGHT = 4
alias ALIGN_INSIDE = 5
alias ALIGN_CLIP = 6
alias ALIGN_WRAP = 7
alias TEXT_OVER_IMAGE = 8
alias IMAGE_OVER_TEXT = 9

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