from .fltk_bindings.bindings import FLTK_WIDGET_POINTER, CombustUIContext
from .EventHandler import EventHandler
from .utils import extract32f64
from collections import Dict
from sys.ffi import DLHandle
from sys.terminate import exit
from .const import getEventNameFromNum

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
        
    fn __init__(out self) raises:
        self.__event_dict = Dict[Int, EventHandler]()
        self.__main_window = FLTK_WIDGET_POINTER()
        self.__loop_hooks = List[fn() raises]()
        self.hasMainWindow = False
        self.__elements = Dict[Int, FLTK_WIDGET_POINTER]()
        self.disableLogging = False


    fn addEventListener(mut self, id: Int, owned handler: EventHandler):
        self.__event_dict[id] = handler^
    
    fn removeEventListener(mut self, id: Int):
        self.__event_dict[id] = EventHandler()

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

    fn execute(mut self, mjui: CombustUIContext) raises:
        if not self.disableLogging:
            print('🔥 Welcome to CombustUI')
            print('Starting Application...')

        while True:
        

            if self.hasMainWindow:
                if not mjui.WindowVisibilityStatus(self.__main_window, 0):
                    print('[Exit Signal]: Main Widget was terminated')                    
                    break

            if mjui.fl_ready() == 1 :
                _ = mjui.fl_check()


            var event = mjui.GrabEvent()
            
            if event != -2:
                var event_type, identifier = extract32f64(event)

                if event_type in self.__event_dict: # Handler which triggers on a certain event globally
                    var handler = self.__event_dict[event_type].copy() 
                    handler.trigger()

                if identifier in self.__event_dict:
                    var handler = self.__event_dict[identifier].copy()
                    if handler.triggerEvent == event_type:
                       handler.trigger()

            
             