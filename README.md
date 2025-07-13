# CombustUI – Lightweight GUI Bindings for Mojo

<p align="center">
    <img src="./logo.jpeg" alt="drawing" width="200" style="border-radius: 10px"/>
</p>

<br/>
CombustUI is a GUI library for Mojo, built on top of FLTK (Fast Light Toolkit) from C++. It provides low-level control by directly calling FLTK functions. Currently, it supports basic event handling and essential widgets such as inputbox, button, window, and grid.

## Installation

To use CombustUI, you first need to have mojo installed on your machine. Once you have mojo set up, run the following commmand to download the app initalization script:

```sh
curl https://raw.githubusercontent.com/Hammad-hab/CombustUI/refs/heads/dev/create_new_app.sh -o ignite_app.sh && chmod +x ignite_app.sh && sudo mv ./ignite_app.sh /usr/local/bin/ignite_app
```

Basically this command downloads the installation script from this github repository, makes it executable and moves it to the `/usr/local/bin` directory to make it accessable directly via cli.

Once installed, run the following command to initalise your app:

```sh
ignite_app
```

The CLI tool will prompt you for your app's name and description before generating the template for using CombustUI. For now, the cli tool is quite crude, and simply copies the entire github repository (removing C++ files while keeping the `.dylib`). In future versions, a more sophisticated and refiend app creation script will be developed.

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
