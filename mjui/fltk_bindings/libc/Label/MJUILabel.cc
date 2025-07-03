#include <FL/Fl_Box.H>
#include <FL/Fl_Flex.H>
#include "../BaseWidgetHelpers.cc"
#include "../BaseWidget.cc"
#include "./MJUILabel.hh"


void MJUILabel::setId(long int new_id) {
    id = new_id;
    
}

MJUILabel::MJUILabel(int x, int y, int w, int h, int id, const char* label): Fl_Box(x, y, w, h, label)
{
        this->labelfont(FL_HELVETICA);
        this->setId(id);
}

void MJUILabel::draw() {
    fl_color(color());  // set color to parent's background color
    fl_rectf(x(), y(), w(), h());  // draw rectangle over the widget area
    Fl_Box::draw();  // first clear background and draw label
}


void MJUILabel::setLabelType(int a) {
    if (a == 0) this->labeltype(FL_NORMAL_LABEL);
    else if (a == 1) this->labeltype(FL_SHADOW_LABEL);
    else if (a == 2) this->labeltype(FL_EMBOSSED_LABEL);
    else if (a == 3) this->labeltype(FL_MULTI_LABEL);
    else if (a == 4) this->labeltype(FL_IMAGE_LABEL);
}


int MJUILabel::handle(int event) {
       enqueueEvent(id, event);

        return 1; // Pass all other events to base class
}



MJUILabel* mjuiCreateLabel(int x, int y, int w, int h, int id, int8_t* text)
{
    const char* label_text = int8ToChar(text);
    MJUILabel *label = new MJUILabel(x, y, w, h, 1200231, label_text);
    return label;
}




void mjuiSetTextProperties(MJUILabel *label, int size, int color, int type) 
{
    if (size != -1) label->labelsize(size);
    if (color != -1) label->labelcolor(color);
    if (type != -1) label->setLabelType(type);
}

Fl_Image* mjuiLoadImg(int width, int height, int imgType, int8_t* path) {
    const char* path_txt = int8ToChar(path);
    Fl_Image* img;
    switch (imgType) {
        case PNG:
            img = new Fl_PNG_Image(path_txt);
            img->scale(width, height, 0);
        break;
        case JPEG:
            img = new Fl_JPEG_Image(path_txt);
            img->scale(width, height, 0);
        break;
        case GIF:
            img = new Fl_GIF_Image(path_txt);
            img->scale(width, height, 0);
        case SVG:
            img = new Fl_SVG_Image(path_txt);
            img->scale(width, height, 0);
        break;
        case ANIM_GIF:
            Fl_Anim_GIF_Image* imgr = new Fl_Anim_GIF_Image(path_txt);
            imgr->scale(width, height, 0);
            return imgr;
        break;
    }
    return img;
}

void mjuiTextAlign(MJUILabel *label, int alignment)
{
    switch (alignment) {
        case 0:
        label->align(FL_ALIGN_CENTER);
        break;
        case 1:
        label->align(FL_ALIGN_TOP);
        break;
        case 2:
        label->align(FL_ALIGN_BOTTOM);
        break;
        case 3:
        label->align(FL_ALIGN_LEFT);
        break;
        case 4:
        label->align(FL_ALIGN_RIGHT);
        break;
        case 5:
        label->align(FL_ALIGN_INSIDE);
        break;
        case 6:
        label->align(FL_ALIGN_CLIP);
        break;
        case 7:
        label->align(FL_ALIGN_WRAP);
        break;
        case 8:
        label->align(FL_ALIGN_TEXT_OVER_IMAGE);
        break;
        case 9:
        label->align(FL_ALIGN_IMAGE_OVER_TEXT);
        break;
    }
}