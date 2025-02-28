#include "MJUIWindow.hh"


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


Fl_Double_Window* mjuiWindowTitleSet(Fl_Double_Window* window, int8_t* new_title_r)
{
    if (window != nullptr)
    {
        char* new_window_title = int8ToChar(new_title_r);
        window->label(new_window_title);
    }
}
