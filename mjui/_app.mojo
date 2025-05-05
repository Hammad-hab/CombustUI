from .fltk_bindings.bindings import FLTK_WIDGET_POINTER, fl_ready, fl_check, grab_fltk_event, mjuiWindowVisibilityStatus
from .EventHandler import EventHandler
from .fltk_bindings.dll import __dll
from collections import Dict
from sys.ffi import DLHandle
from sys.terminate import exit
from .const import getEventNameFromNum

struct Application:
    var __dll: DLHandle
    var __event_dict: Dict[Int, EventHandler]
    var __elements: Dict[Int, FLTK_WIDGET_POINTER]
    var __main_window: FLTK_WIDGET_POINTER
    var hasMainWindow: Bool
    var disableLogging: Bool
    
    fn __init__(mut self):
        self.__dll = __dll
        self.__event_dict = Dict[Int, EventHandler]()
        self.__main_window = FLTK_WIDGET_POINTER()
        self.hasMainWindow = False
        self.__elements = Dict[Int, FLTK_WIDGET_POINTER]()
        self.disableLogging = False

    fn addEventListener(mut self, id: Int, handler: EventHandler):
        self.__event_dict[id] = handler

    fn setElementById(mut self, id: Int, element: FLTK_WIDGET_POINTER):
        self.__elements[id] = element
    
    fn getElementById(mut self, id: Int) raises -> FLTK_WIDGET_POINTER:
        var pointer = self.__elements[id]
        return pointer

    fn markWindowPTRAsMain(mut self, read ptr: FLTK_WIDGET_POINTER):
        self.__main_window = ptr
        self.hasMainWindow = True

    fn execute(mut self) raises:

        print('Welcome to CombustUI')
        print('Starting Application...')
        while True:
            if self.hasMainWindow:
                if not mjuiWindowVisibilityStatus(self.__main_window, 0):
                    print('[Exit Signal]: Main Widget was terminated')
                    
                    break

            if fl_check() == 1 :
                _ = fl_ready()

            var event = grab_fltk_event()
            if event != 2:
                var event_type =  (event & 4294967295)
                var identifier =  (event >> 32) & 4294967295
                try:
                    var handler = self.__event_dict[identifier]
                    if handler.triggerEvent == event_type:
                       handler.trigger()
                    else:
                        var error = ('[MJUI]: Couldn\'t find Matching handler for Widget#'+ str[Int](identifier) + " while resolving event " + getEventNameFromNum(event_type))
                        if not self.disableLogging:
                            print(error)
                except err:
                    var error = ('[MJUI]: Failed to trace event handler function for Widget#'+ str[Int](identifier))
                    if not self.disableLogging:
                        print(error)
