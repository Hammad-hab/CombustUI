#include <FL/Fl_Box.H>
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


MJUILabel* mjuiCreateLabel(int x, int y, int w, int h, int8_t* text)
{
    const char* label_text = int8ToChar(text);
    MJUILabel *label = new MJUILabel(x, y, w, h, 1200231, label_text);

    return label;
}


void mjuiSetTextProperties(MJUILabel *label, int size, Fl_Color color) 
{
    label->labelsize(size);
    label->labelcolor(color);
}