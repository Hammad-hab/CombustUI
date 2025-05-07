from mjui._app import Application, FLTK_WIDGET_POINTER
from mjui.fltk_bindings.bindings import *
from memory.pointer import Pointer
from mjui.fltk_bindings.dll import __dll
from mjui.utils import readFromStringBytes, rgb, convertStringToBytes, EMPTY, createIdFrom
from mjui.EventHandler import EventHandler
from mjui.const import *
import os

var app = Application()

fn printer() raises:
   print("Hi there!")
   

fn main() raises:
   app.disableLogging = True
   var window = mjuiSpawnWindow(1000, 500, 1, 0, 0, convertStringToBytes("New Window"))
   mjuiWidgetColor(window, rgb(255, 255, 255))
   var layout = mjuiCreateLayoutFlex(0, 0, 1000, 500, 0)
   mjuiSetFlexResize(layout, RESIZE_XONLY)

   var label = mjuiCreateButton(500, 100, 100, 25, 243, convertStringToBytes("This app crashes things!"))
   var empty = mjuiCreateLabel(500, 100, 100, 25, EMPTY)
   var button = mjuiCreateButton(500, 250, 100, 25, createIdFrom('hello'), convertStringToBytes("Crash App!"))

   mjuiSetSelectionColor(label, rgb(255, 0, 0))
   mjuiSetSelectionColor(button, rgb(255, 0, 0))

   var printerHandler = EventHandler()
   printerHandler.attachHandler(printer)
   
   printerHandler.attachTrigger(MJUI_PUSH)
   app.addEventListener(createIdFrom('hello'), printerHandler)
   
   END_WIDGET_APPEND(layout)

   mjuiFlexCalculateLayout(layout)
   mjuiWindowSetResizable(window, layout)
   mjuiShowWidget(window)
   
   app.markWindowPTRAsMain(window)
   app.execute()
