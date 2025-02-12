#include<FL/Fl_Box.H>
#include <FL/Fl_PNG_Image.H>
Fl_Box* create_image(const char * filepath)
{
    Fl_PNG_Image *image = new Fl_PNG_Image(filepath);
    Fl_Box *box = new Fl_Box(0, 0, image->w(), image->h());
    box->image(image);
    return box;
}

