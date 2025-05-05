# MJUI Toolkit Documentation

MJUI is a Mojo-based UI toolkit that provides bindings to FLTK (Fast Light Toolkit) and offers a simple, efficient way to create graphical user interfaces in Mojo.

## Table of Contents
- [Installation](#installation)
- [Core Components](#core-components)
- [Event System](#event-system)
- [Constants](#constants)
- [Utility Functions](#utility-functions)
- [Types](#types)
- [FLTK Bindings](#fltk-bindings)

## Installation

To use MJUI in your project, ensure you have the following directory structure:
```
mjui/
├── __init__.mojo
├── _app.mojo
├── const.mojo
├── EventHandler.mojo
├── types.mojo
├── utils.mojo
├── fltk_bindings/
└── examples/
```

## Core Components

### Application Class
The main application class that handles the UI event loop and widget management.

```mojo
from mjui import Application

# Create application instance
app = Application()
```

Key methods:
- `addEventListener(id: Int, handler: EventHandler)`: Register an event handler for a specific widget
- `setElementById(id: Int, element: FLTK_WIDGET_POINTER)`: Associate a widget with an ID
- `getElementById(id: Int)`: Retrieve a widget by its ID
- `markWindowPTRAsMain(ptr: FLTK_WIDGET_POINTER)`: Set the main window
- `execute()`: Start the application event loop

## Event System

### EventHandler
A value struct that manages event handling for widgets.

```mojo
from mjui import EventHandler

# Create an event handler
handler = EventHandler()
handler.set(my_handler_function, trigger_event)
```

Methods:
- `set(handler: Handler, trigger: Int)`: Set the handler function and trigger event
- `attachHandler(handler: Handler)`: Set the handler function
- `attachTrigger(trigger: Int)`: Set the trigger event
- `trigger()`: Execute the handler function

## Constants

### Cursor Types
```mojo
MJUI_CURSOR_DEFAULT = 0
MJUI_CURSOR_ARROW = 35
MJUI_CURSOR_CROSS = 66
MJUI_CURSOR_WAIT = 76
# ... and more
```

### Event Types
```mojo
MJUI_NO_EVENT = 0
MJUI_PUSH = 1
MJUI_RELEASE = 2
MJUI_ENTER = 3
MJUI_LEAVE = 4
# ... and more
```

### Layout Constants
```mojo
MJUI_MJUIEX_HORIZONTAL = 1
MJUI_MJUIEX_VERTICAL = 0
RESIZE_XY = 100
RESIZE_XONLY = 110
RESIZE_YONLY = 111
```

## Utility Functions

### Color Utilities
```mojo
from mjui.utils import rgb_to_i32

# Convert RGB values to color integer
color = rgb_to_i32(255, 128, 0)  # Orange color
```

### String Utilities
```mojo
from mjui.utils import str_to_int8, readFromStringBytes, createIdFrom

# Convert string to ASCII codes
ascii_codes = str_to_int8("Hello")

# Create numeric ID from string
widget_id = createIdFrom("button1")
```

### Data Management
```mojo
from mjui.utils import DataStore

# Create a typed data store
store = DataStore[Int]()
index = store.store(42)
value = store.getAt(index)
```

## Types

MJUI defines several important types for working with FLTK:

```mojo
FLTK_POINTER = fn() -> Int32
FLTK_WIDGET_POINTER = UnsafePointer[FLTK_POINTER]
StringBytes = Span[Int8, StaticConstantOrigin]
```

## FLTK Bindings

MJUI provides a comprehensive set of bindings to the FLTK (Fast Light Toolkit) library. These bindings allow you to create and manipulate GUI elements directly from Mojo.

### Window Management

```mojo
from mjui.fltk_bindings.bindings import mjuiSpawnWindow, mjuiSetWindowTitle, mjuiWindowVisibilityStatus

# Create a new window
window = mjuiSpawnWindow(
    w=800,           # width
    h=600,           # height
    resize=1,        # resizable
    no_border=0,     # show border
    fullscreen=0,    # not fullscreen
    label="My App"   # window title
)

# Set window title
mjuiSetWindowTitle(window, "New Title")

# Check window visibility
is_visible = mjuiWindowVisibilityStatus(window, 0)

# Make a widget resizable within window
mjuiWindowSetResizable(window, widget)
```

### Widget Creation

```mojo
# Create a label
label = mjuiCreateLabel(x=10, y=10, w=100, h=30, "Hello World")

# Create a button
button = mjuiCreateButton(x=10, y=50, w=100, h=30, id=1, "Click Me")

# Create an input field
input = mjuiCreateInput(x=10, y=90, w=200, h=30, id=2, "Enter text...")
```

### Layout Management

```mojo
# Create a flex layout
flex_layout = mjuiCreateLayoutFlex(x=0, y=0, w=800, h=600, dir=MJUI_MJUIEX_VERTICAL)

# Begin adding widgets to layout
BEGIN_WIDGET_APPEND(flex_layout)

# Add widgets here...

# End widget append
END_WIDGET_APPEND(flex_layout)

# Calculate layout
mjuiFlexCalculateLayout(flex_layout)

# Set flex resize behavior
mjuiSetFlexResize(flex_layout, MJUI_MJUIEX_HORIZONTAL)
```

### Widget Styling

```mojo
# Set widget background color
mjuiWidgetColor(widget, rgb_to_i32(255, 128, 0))  # Orange background

# Set widget text color
mjuiWidgetTextColor(widget, rgb_to_i32(0, 0, 0))  # Black text

# Set selection color
mjuiSetSelectionColor(widget, rgb_to_i32(0, 128, 255))  # Blue selection

# Set text properties
mjuiSetTextProperties(widget, size=14, colour=rgb_to_i32(0, 0, 0))

# Set widget label
mjuiSetWidgetLabel(widget, "New Label")
```

### Input Handling

```mojo
# Get input field value
input_value = mjuiGrabInput(input_widget)

# Load image into widget
mjuiLoadImage(widget, "path/to/image.png")
```

### Event Loop Functions

```mojo
# Check for events
event_status = fl_check()

# Process ready events
ready_status = fl_ready()

# Get current event
current_event = grab_fltk_event()
```

### Widget Management

```mojo
# Show a widget
mjuiShowWidget(widget)

# Set widget ID (for buttons)
mjuiSetWidgetId_button(button, 1)
```

### Best Practices for FLTK Bindings

1. **Memory Management**
   - Always maintain references to created widgets
   - Clean up resources when windows are closed

2. **Event Handling**
   - Use the event loop functions in the correct order
   - Process events regularly to keep the UI responsive

3. **Layout Management**
   - Use flex layouts for responsive designs
   - Calculate layouts after making changes
   - Follow the BEGIN_WIDGET_APPEND/END_WIDGET_APPEND pattern

4. **Widget Hierarchy**
   - Maintain proper parent-child relationships
   - Use appropriate containers for widget groups

5. **Error Handling**
   - Check return values from binding functions
   - Handle window closure events properly

### Example: Creating a Complete Window

```mojo
from mjui.fltk_bindings.bindings import *
from mjui.utils import rgb_to_i32

# Create main window
window = mjuiSpawnWindow(800, 600, 1, 0, 0, "MJUI Example")

# Create flex layout
layout = mjuiCreateLayoutFlex(0, 0, 800, 600, MJUI_MJUIEX_VERTICAL)

# Begin adding widgets
BEGIN_WIDGET_APPEND(layout)

# Add a label
label = mjuiCreateLabel(10, 10, 200, 30, "Welcome to MJUI")
mjuiWidgetTextColor(label, rgb_to_i32(0, 0, 255))

# Add a button
button = mjuiCreateButton(10, 50, 100, 30, 1, "Click Me")
mjuiWidgetColor(button, rgb_to_i32(200, 200, 200))

# Add an input field
input = mjuiCreateInput(10, 90, 200, 30, 2, "Enter text...")

END_WIDGET_APPEND(layout)

# Calculate layout
mjuiFlexCalculateLayout(layout)

# Make window resizable
mjuiWindowSetResizable(window, layout)

# Show the window
mjuiShowWidget(window)
```

This comprehensive set of bindings allows you to create sophisticated graphical user interfaces using MJUI and FLTK. The bindings provide a bridge between Mojo's type system and FLTK's C++ functionality, enabling you to build native-looking applications with good performance.

## Best Practices

1. Always handle window closure properly by checking visibility status
2. Use event handlers for widget interactions
3. Maintain references to important widgets using the element ID system
4. Properly manage memory and resources
5. Use the provided utility functions for color and string management

## Example Usage

```mojo
from mjui import Application, EventHandler
from mjui.const import MJUI_PUSH

def button_click() raises:
    print("Button clicked!")

# Create application
app = Application()

# Create event handler
handler = EventHandler()
handler.set(button_click, MJUI_PUSH)

# Add event listener
app.addEventListener(1, handler)

# Start application
app.execute()
```

## Error Handling

The toolkit provides built-in error handling and logging:

- Event handling errors are logged if not disabled
- Invalid widget IDs are reported
- Main window closure is detected and handled

To disable logging:
```mojo
app = Application()
app.disableLogging = True
```
