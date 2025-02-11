from .dll import FLTK_WIDGET_POINTER, __dll, fl_ready, fl_check, grabEventFromFLTK, set_id
from collections import Dict
from sys.ffi import DLHandle


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
       
    fn execute(mut self) raises -> None:

        print('Welcome to MojoUI')
        print('Starting Application...')
        while True:
            if fl_ready() == 1:
                _ = fl_check()

            var event = grabEventFromFLTK()
            if event != 2:
                var event_type =  (event & 4294967295)
                var identifier =  (event >> 32) & 4294967295
                try:
                    var handler = self.__event_dict[identifier]
                    handler()
                except:
                    print('[MJUI]: Failed to trace function for Fl_Widget#'+ str[Int32](identifier))