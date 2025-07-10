"""
    Default Get Started template which comes with every app
"""
from mjui._app import Application
from mjui.fltk_bindings.bindings import *
from mjui.utils import rgb, convertStringToBytes, GTK
from mjui.const import *

var __app = Application()

fn main() raises:
    useScheme(GTK)
    
    var window = mjuiCreateWindow(1000, 600, 1, 0, 0, convertStringToBytes("Welcome"))
    var label = mjuiCreateLabel(0, 0, 1000, 600, 1, convertStringToBytes('Welcome to CombustUI🔥'))
    mjuiSetWidgetColor(label, rgb(255, 154, 72))
    
    mjuiSetTextProperties(label, 48, rgb(0, 0, 0), MJUI_LABEL_TYPE_NORMAL)
    mjuiShowWidget(window)
    __app.markWindowPTRAsMain(window)
    __app.execute()