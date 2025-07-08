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
from mjui.utils import readFromStringBytes, rgb_to_i32
from mjui.EventHandler import EventHandler
from mjui.const import *
import os

var app = Application()

fn printer() raises:
   print("Hi there!")

fn main() raises:

  
    var window = mjuiSpawnWindow(1000, 500, 1, 0, 0, "New Window".as_bytes())
    mjuiWidgetColor(window, rgb_to_i32(255, 255, 255))

    var label = mjuiCreateLabel(500, 250, 100, 100, "This app crashes things!".as_bytes())
    var button = mjuiCreateButton(500, 250, 50, 25, "Crash App!".as_bytes())
    var printerHandler = EventHandler()

    printerHandler.attachHandler(printer)
    printerHandler.attachTrigger(MJUI_PUSH)
    mjuiSetWidgetId_button(button, 12312)
    app.setElementById(23, label)
    app.addEventListener(12312, printerHandler)
  
    mjuiShowWidget(window)
    app.markWindowPTRAsMain(window)
    app.execute()

```

For now, the API is functional but as soon as the basics are completed, a struct-trait-based API will be introduced.
