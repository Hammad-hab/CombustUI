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

void MJUILabel::setLabelType(int a) {
    if (a == 0) this->labeltype(FL_NORMAL_LABEL);
    else if (a == 1) this->labeltype(FL_SHADOW_LABEL);
    else if (a == 2) this->labeltype(FL_EMBOSSED_LABEL);
    else if (a == 3) this->labeltype(FL_MULTI_LABEL);
    else if (a == 4) this->labeltype(FL_IMAGE_LABEL);
}


MJUILabel* mjuiCreateLabel(int x, int y, int w, int h, int8_t* text)
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