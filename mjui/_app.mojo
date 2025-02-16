from .fltk_bindings import FLTK_WIDGET_POINTER, fl_ready, fl_check, grab_fltk_event, set_id, message_dialog
from .fltk_bindings.dll import __dll
from collections import Dict
from sys.ffi import DLHandle
from sys.terminate import exit

var isRunning = True
struct Application:
    var __dll: DLHandle
    var __event_dict: Dict[Int, fn() raises]
    var __elements: Dict[Int, FLTK_WIDGET_POINTER]
    
    fn __init__(mut self):
        self.__dll = __dll
        self.__event_dict = Dict[Int, fn() raises]()
        self.__elements = Dict[Int, FLTK_WIDGET_POINTER]()

    fn addEventListener(mut self, id: Int, handler: fn() raises):
        self.__event_dict[id] = handler

    fn setElementById(mut self, id: Int, element: FLTK_WIDGET_POINTER):
        self.__elements[id] = element
    
    fn setElementId(mut self, element: FLTK_WIDGET_POINTER, id: Int):
        set_id(element, id)

    fn getElementById(mut self, id: Int) raises -> FLTK_WIDGET_POINTER:
        var pointer = self.__elements[id]
        return pointer


    fn execute(mut self) raises:

        print('Welcome to CombustUI')
        print('Starting Application...')
        while isRunning:
            
            if fl_ready() == 1 :
                _ = fl_check()

            var event = grab_fltk_event()
            if event != 2:
                var event_type =  (event & 4294967295)
                var identifier =  (event >> 32) & 4294967295
                try:
                    var handler = self.__event_dict[identifier]
                    handler()
                except err:
                    var error = ('[MJUI]: Failed to trace event handler function for Widget').as_bytes()
                    message_dialog(error)

                    # print('[MJUI]: Handler raised error ' + err.
