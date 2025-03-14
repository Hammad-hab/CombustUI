#include "MJUIWindow.hh"
#include<FL/Fl_Box.H>
Fl_Double_Window* mjuiCreateWindow(
    int width,
    int height,
    int resize,
    int fullscreen, 
    int no_border,
    int8_t* title_r
)
{
    char* window_title = int8ToChar(title_r);
    Fl_Double_Window* window = new Fl_Double_Window(width, height, window_title);
    if (resize) 
        window->resizable(window);

    if (fullscreen)
        window->fullscreen();

    if (no_border)
        window->clear_border();

    return window;
}


void mjuiWindowTitleSet(Fl_Double_Window* window, int8_t* new_title_r)
{
    if (window != nullptr)
    {
        char* new_window_title = int8ToChar(new_title_r);
        window->label(new_window_title);
    }
}


int mjuiWindowVisibilityStatus(Fl_Double_Window* window, int condition) {
    switch (condition) 
    {
        case WINDOW_VISIBLE:
            return (window -> shown());
        break;

        case WINDOW_MINIMIZED:
            return (window->shown()&&!window->visible());
        
    }

    return -1;
}