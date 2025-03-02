#ifndef MJUILABEL_H

class MJUILabel: public Fl_Box, public BaseWidget 
{
    // TODO: Add more custom features
    public:
        long int id;
        virtual void setId(long int new_id) override;
        MJUILabel(int x, int y, int w, int h, int id, const char* label);
};

MJUILabel *mjuiCreateLabel(int x, int y, int width, int height, int id,  int8_t* text);
void mjuiSetTextProperties(MJUILabel *label, int size, Fl_Color color);


#endif