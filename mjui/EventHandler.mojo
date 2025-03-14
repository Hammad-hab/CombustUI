
alias Handler = fn() raises

@value
struct EventHandler:
    var handler: Handler
    var triggerEvent: Int

    alias NULL_EVENT = -1
    
    @staticmethod
    fn null_handler() raises:
        pass

    fn __init__(mut self):
        self.handler = EventHandler.null_handler
        self.triggerEvent = self.NULL_EVENT

    fn set(mut self, handler: Handler, trigger: Int):
        self.attachHandler(handler)
        self.attachTrigger(trigger)

    fn attachHandler(mut self, handler: Handler):
        self.handler = handler
    
    fn attachTrigger(mut self, trigger: Int):
        self.triggerEvent = trigger
    
    fn trigger(read self) raises:
        self.handler()