#ifndef BASE_WIDGET_H

#define BASE_WIDGET_H


class BaseWidget
{
    public:
        long int id;
        int borderRadius;
        virtual void setId(long int new_id)  {
            id = new_id;
        };

        virtual void setBorderRadius(int radius) {
            borderRadius = radius;
        }
};


#endif 