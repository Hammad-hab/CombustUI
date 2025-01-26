from .const import FLTK_WIDGET_POINTER, __dll
struct Application:
    var __dll: DLHandle

    fn __init__(mut self):
        self.__dll = __dll
    
    
    fn execute(mut self) raises -> None:
        # fltk_exec() # low-level call
        self.__dll.call['fltk_execute']()

        