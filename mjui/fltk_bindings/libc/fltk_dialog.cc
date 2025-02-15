/*TODO Include fl_ask, fl_message etc */
#include<FL/fl_ask.H>
#include<FL/Fl_Double_Window.H>
#include<FL/Fl_Box.H>
#include<string.h>
#include<FL/Fl_PNG_Image.H>
#include<FL/Fl_Button.H>

class MJUI_DialogBox: public Fl_Double_Window {
    public:
        bool dragging;
        int drag_x;
        int drag_y;
        Fl_Box *img;

        MJUI_DialogBox(int X, int Y, int W, int H, const char *l): Fl_Double_Window(X, Y, W, H, l)
        {
            this->begin();
            
            Fl_PNG_Image *image = new Fl_PNG_Image("assets/error.png");
            image->scale(100, 100);
            this->img = new Fl_Box(10, (this->h()/2) - (image->h()/2), image->w(), image->h());
            this->img->image(image);
            this->color(128);
            this->img->show();

            size_t length = strlen("MJUI_ERROR");
            Fl_Box *heading = new Fl_Box(0, 0, 100, 100, "MJUI_ERROR");
            heading->position(10 + length, (this->h()/2) - image->h() - 10);

            Fl_Box *text = new Fl_Box(0, 0, 100, 100, l);
            text->position(this->w()/2, (this->h()/2) - image->h()/2);

            Fl_Button *btn = new Fl_Button(this->w()/2 - 50, (this->h()) - 50, 100, 25, "Exit");
            btn->box(FL_FLAT_BOX);
            btn->color(FL_WHITE);
            btn->callback(this->exit);
            btn->selection_color(FL_DARK1);
            this->end();
            this->clear_border();
        }

        static void exit(Fl_Widget* self) {
            self->parent()->hide();
        }

};