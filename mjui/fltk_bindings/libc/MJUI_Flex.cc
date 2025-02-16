#include <FL/Fl.H>
#include <FL/Fl_Box.H>
#include <FL/Fl_Flex.H>
#include<stdint.h>
#include<stdio.h>



class MJUI_Flex: public Fl_Flex {
    public :
        //...

        MJUI_Flex(int X, int Y, int W, int H, int DIR): Fl_Flex(X, Y, W, H, DIR)
        {}


        void resize(int X, int Y, int W, int H) override {
             Fl_Flex::resize(X, Y, W, this->h());
        }
};