from .fltk_bindings.bindings import FLTK_WIDGET_POINTER, fl_ready, fl_check, mjuiGrabEvent, mjuiWindowVisibilityStatus
from .EventHandler import EventHandler
from .fltk_bindings.dll import __dll
from collections import Dict
from sys.ffi import DLHandle
from sys.terminate import exit
from .const import getEventNameFromNum

@value
struct Application():
    var __event_dict: Dict[Int, EventHandler]
    var __elements: Dict[Int, FLTK_WIDGET_POINTER]
    var __loop_hooks: List[fn() raises]
    var __main_window: FLTK_WIDGET_POINTER
    var hasMainWindow: Bool
    var disableLogging: Bool

    fn __moveinit__(out self, owned existing: Self):
        self.__event_dict = existing.__event_dict
        self.__elements = existing.__elements
        self.__main_window = existing.__main_window
        self.__loop_hooks = existing.__loop_hooks
        self.hasMainWindow = existing.hasMainWindow
        self.disableLogging = existing.disableLogging
        
    fn __init__(mut self):
        self.__event_dict = Dict[Int, EventHandler]()
        self.__main_window = FLTK_WIDGET_POINTER()
        self.__loop_hooks = List[fn() raises]()
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

    fn attachLoopHook(mut self, hook: fn() raises):
        self.__loop_hooks.append(hook)

    fn execute(mut self) raises:
        if not self.disableLogging:
            print('Welcome to CombustUI')
            print('Starting Application...')
        while True:
            

            if self.hasMainWindow:
                if not mjuiWindowVisibilityStatus(self.__main_window, 0):
                    print('[Exit Signal]: Main Widget was terminated')                    
                    break

            if fl_ready() == 1 :
                _ = fl_check()


            var event = mjuiGrabEvent()
            if event != -2:
                var event_type =  (event & 4294967295)
                var identifier =  (event >> 32) & 4294967295
                if identifier in self.__event_dict:
                    var handler = self.__event_dict[identifier]
                    if handler.triggerEvent == event_type:
                       handler.trigger()

            for loop in self.__loop_hooks:
                loop()
            