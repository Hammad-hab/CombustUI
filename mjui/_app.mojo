from .const import FLTK_WIDGET_POINTER, __dll, fl_ready, fl_check
struct Application:
    var __dll: DLHandle

    fn __init__(mut self):
        self.__dll = __dll
    
    
    fn execute(mut self) raises -> None:
        # fltk_exec() # low-level call
        print('Welcome to MojoUI')
        var fn_ = __dll.get_function[fn() -> Int32]('listEvents')
        print('Starting Application...')
        while True:
            if fl_ready() == 1:
                _ = fl_check()
            # app.execute()
            var x= fn_()
            print(x)

        