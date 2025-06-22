
alias Handler = fn() raises


@value
struct EventHandler:
    """
    EventHandler is a class that allows you to store a handler and a trigger event together
    so that it can be passed to the application and be called when the event is triggered.

    Example:
        ```
            var handler = EventHandler()
            handler.set(MJUI_KEYDOWN, printer) # Let us suppose printer is a function that prints the key pressed
            app.addEventListener(1, handler) # 1 is the id of an input field

            # When the key is pressed, the printer function will be called
        ```
    Similarly you can attach the trigger and handler seperately
    Example: 
        ```
            var handler = EventHandler()
            handler.attachTrigger(MJUI_KEYDOWN)
            handler.attachHandler(printer)
            app.addEventListener(1, handler)

            # When the key is pressed, the printer function will be called
        ```
    """
    var handler: Handler
    var triggerEvent: Int

    alias NULL_EVENT = -1
    
    @staticmethod
    fn null_handler() raises:
        pass

    fn __init__(out self):
        self.handler = EventHandler.null_handler
        self.triggerEvent = self.NULL_EVENT


    fn set(mut self: EventHandler, trigger: Int, handler: Handler):
        self.attachTrigger(trigger)
        self.attachHandler(handler)

    fn attachHandler(mut self: EventHandler, handler: Handler):
        self.handler = handler
    
    fn attachTrigger(mut self: EventHandler, trigger: Int):
        self.triggerEvent = trigger
    
    fn trigger(read self) raises:
        self.handler()