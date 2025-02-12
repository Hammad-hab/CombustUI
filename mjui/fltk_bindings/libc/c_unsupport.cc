#include <FL/Fl_Box.H>
#include <FL/Fl_PNG_Image.H>

Fl_Box *create_image(const char *filepath, int w, int h)
{
    Fl_PNG_Image *image = new Fl_PNG_Image(filepath);
    // if (h!=-1&&w!=-1) {
    // }
    // else if (w != -1) {
    //     image->scale(w, image->h());
    // } else if (h != -1) {
    //     image->scale(image->w(), h);
    // }
    Fl_Box *box = new Fl_Box(0, 0, image->w(), image->h());
    box->image(image);
    return box;
}

void set_scale(Fl_PNG_Image *img, int w, int h)
{
    img->scale(w, h);
}