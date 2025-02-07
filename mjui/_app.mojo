from .const import FLTK_WIDGET_POINTER, __dll, fl_ready, fl_check
from collections import Dict
struct Application:
    var __dll: DLHandle
    var __event_dict: Dict[Int, fn()]

    fn __init__(mut self):
        self.__dll = __dll
        self.__event_dict = Dict[Int, fn()]()
    
    fn addEventListener(mut self, id: Int, handler: fn()):
        self.__event_dict[id] = handler

    fn execute(mut self) raises -> None:
        # fltk_exec() # low-level call
        print('Welcome to MojoUI')
        var grabEvent = __dll.get_function[fn() -> Int]('listEvents')
        print('Starting Application...')
        while True:
            if fl_ready() == 1:
                _ = fl_check()

            var event = grabEvent()
            if event != 2:
                var event_type =  (event & 4294967295)
                var identifier =  (event >> 32) & 4294967295
                try:
                    var handler = self.__event_dict[identifier]
                    handler()
                except:
                    print('[MJUI]: Failed to trace function for Fl_Widget#'+ str[Int32](identifier))