# CombustUI – Lightweight GUI Bindings for Mojo

<div style="display:block; margin: auto;">
    <img src="mjui/examples/logo.jpeg" alt="drawing" width="200" style="border-radius: 10px"/>
</div>

<br/>
CombustUI is a GUI library for Mojo, built on top of FLTK (Fast Light Toolkit) from C++. It provides low-level control by directly calling FLTK functions. Currently, it supports basic event handling and essential widgets such as inputbox, button, window, and grid.


## Installation

To use CombustUI, you first need to have mojo installed on your machine. Once you have mojo set up, run the following commmand to download the app initalization script:

```sh
curl https://raw.githubusercontent.com/Hammad-hab/CombustUI/refs/heads/main/create_new_app.sh -o ignite_app.sh && chmod +x ignite_app.sh && sudo mv ./ignite_app.sh /usr/local/bin/ignite_app
```

Basically this command downloads the installation script from this github repository, makes it executable and moves it to the `/usr/local/bin` directory to make it accessable directly via cli.

Once installed, run the following command to initalise your app:
```sh
ignite_app
```

The CLI tool will prompt you for your app's name and description before generating the template for using CombustUI. For now, the cli tool is quite crude, and simply copies the entire github repository (removing C++ files while keeping the `.dylib`). In future versions, a more sophisticated and refiend app creation script will be developed.

## Example Application

```mojo
from mjui._app import Application, FLTK_WIDGET_POINTER, isRunning
from mjui.fltk_bindings import *
from memory.pointer import Pointer
from mjui.fltk_bindings.dll import __dll
from mjui.utils import readFromStringBytes, rgb_to_i32, filter, DataStore
import os

fn main() raises:
    var app = Application()

    var window = fltk_create_window_new(1000, 500, "The end".as_bytes())
    begin_widget_child_append(window)
    var flexbox = fltk_layout_flex(0, 0, 1000, 100)
    end_widget_child_append(window)
    begin_widget_child_append(window)
    begin_widget_child_append(flexbox)

    var btn = fltk_create_button_new(0, 0, 10, 10, "Exit".as_bytes())
    var btn2 = fltk_create_button_new(0, 0, 10, 10, "Save".as_bytes())
    var label = fltk_create_text_label(0, 0, 100, 100, "Hello World".as_bytes())

    show_widget(flexbox)
    show_widget(window)

    app.execute()

```

For now, the API is functional but as soon as the basics are completed, a struct-trait-based API will be introduced.

