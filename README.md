<p align="center">
    <img src="docs/images/logo.png" alt="drawing" width="500" style="border-radius: 10px"/>
</p>
<nav style='display:flex; flex-direction: row; width: 100%;  gap:50px; justify-content: center; '>
    <li>
        <a href='https://hammad-hab.github.io/CombustUI/INSTALLATION.html'> Installation</a>
    </li>
    <li>
    <a href='https://hammad-hab.github.io/CombustUI/API_REFERENCE.html'> 
        API Reference
    </a>
    </li>
    <li>
    <a href='https://hammad-hab.github.io/CombustUI/EXAMPLES.html'> 
    Examples
    </a>
    </li>
</nav>
<br/>
CombustUI is a GUI library for Mojo, built on top of FLTK (Fast Light Toolkit) from C++. It provides low-level control by directly calling FLTK functions. Currently, it supports basic event handling and essential widgets such as inputbox, button, window, and grid.

## Example Application

```mojo
from mjui._app import Application, FLTK_WIDGET_POINTER
from mjui.fltk_bindings.bindings import *
from memory.pointer import Pointer
from mjui.fltk_bindings.dll import __dll
from mjui.utils import rgb, convertStringToBytes, readFromStringBytes, GTK

from mjui.EventHandler import EventHandler
from mjui.const import *
import os

var __app = Application()

fn scroll() raises:
   var scroll = __app.getElementById(206)
   mjuiScrollBy(scroll, 10, 0)


fn redraw_gif() raises:
   var gif = __app.getElementById(22)
   mjuiRedraw(gif)

fn main() raises:
    useScheme(GTK)

    var window = mjuiCreateWindow(1000, 600, 1, 0, 0, convertStringToBytes("App"))
    mjuiSetWidgetColor(window, rgb(255, 181, 181))
    var c = mjuiScrollContainer(0, 0, 1000, 600)
    __app.setElementById(206, c)
    var l = mjuiCreateLayoutFlex(0, 0, 1000, 500, 1)
    mjuiSetFlexResize(l, RESIZE_XY)
    mjuiSetFlexMarginGapSettings(l, 5, 5) # Padding of base layout
    # Nested Layout
    mjuiSetWidgetColor(c, rgb(255, 181, 181))

    mjuiScrollSetBarFGColor(c, rgb(255, 181, 181), 2)

    var l2 = mjuiCreateLayoutFlex(0, 0, 500, 500, 0)
    mjuiSetFlexMarginGapSettings(l2, 5, 5)
    mjuiSetFlexResize(l2, RESIZE_XY)

    var input1 = mjuiCreateInput(450, 250, 100, 100, 2532, convertStringToBytes("Enter Something"))
    var input2 = mjuiCreateMultilineInput(450, 250, 100, 100, 200, convertStringToBytes("Enter Something Longer"))
    var button = mjuiCreateButton(450, 250, 100, 100, 24232, convertStringToBytes("Scroll"))
    mjuiSetWidgetSelectionColor(input1, rgb(251, 244, 191))

    mjuiSetWidgetColor(button, rgb(255, 109, 109))
    mjuiSetWidgetSelectionColor(button, rgb(255, 84, 84))
    mjuiSetWidgetBox(input1, MJUI_FLAT_BOX)
    mjuiSetWidgetBox(input2, MJUI_FLAT_BOX)

    mjuiSetFlex(l2, input1, 50)
    mjuiSetFlex(l2, button, 50)

    mjuiFlexCalculateLayout(l2)
    END_WIDGET_APPEND(l2) # ending flex 2

    var l3 = mjuiCreateLayoutFlex(0, 0, 500, 500, 0)

    mjuiSetFlexMarginGapSettings(l3, 100, 100)

    var label = "Duck"
    var img = mjuiCreateLabel(1, 1, 0, 0, 132, convertStringToBytes("Duck"))
    var gif = mjuiLoadImg(200, 200, 5, convertStringToBytes("XOsX.gif"))
    mjuiApplyImage(img, gif)
    mjuiSetWidgetColor(img, rgb(255, 181, 181))

    __app.setElementById(22, img)

    END_WIDGET_APPEND(l3)
    END_WIDGET_APPEND(l)
    mjuiFlexCalculateLayout(l)

    var printerHandler = EventHandler()

    printerHandler.attachHandler(scroll)
    printerHandler.attachTrigger(MJUI_PUSH)

    __app.addEventListener(24232, printerHandler)
    __app.setElementById(200, input2)

    mjuiShowWidget(window)
    mjuiFlexCalculateLayout(l)
    END_WIDGET_APPEND(c)
    __app.attachLoopHook(redraw_gif)
    __app.markWindowPTRAsMain(window)
    __app.execute()
```

For now, the API is functional but as soon as the basics are completed, a struct-trait-based API will be introduced.

## OS Support

- [x] MacOS
- [x] Debian
- [ ] Arch
- [ ] RHEL
  - [x] CentOS
