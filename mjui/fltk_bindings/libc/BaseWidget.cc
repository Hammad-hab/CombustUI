#ifndef BASE_WIDGET_H

#define BASE_WIDGET_H


class BaseWidget
{
    public:
        long int id;
        virtual void setId(long int new_id)  {
            id = new_id;
        };
};


#endif 