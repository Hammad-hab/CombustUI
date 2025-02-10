#include<stdio.h>


#ifndef UTILS

#define UTILS

void enqueueEvent(int id, int event) {
    Events[id] = event;
}

void unqueueEvent(int id) {
    Events[id] = 0;
}

int widgetHandle(int id, int event)
{
    enqueueEvent(id, event);

    return event;
}

int64_t listEvents() {
    for (auto x : Events) {
        if (x.second == 0) continue;
        Events[x.first] = 0;
        uint64_t combined = ((uint64_t)x.first << 32) | x.second;
        return (combined);
    }
    // return "NULL"
    return 2;
}




#endif