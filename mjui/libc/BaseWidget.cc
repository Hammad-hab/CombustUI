#include<stdio.h>

void enqueueEvent(const char* id, int event) {
    Events[id] = event;
}

void unqueueEvent(const char* id) {
    Events[id] = 0;
}

int widgetHandle(const char* id, int event)
{
    enqueueEvent(id, event);

    return event;
}


void listEvents() {
      for (auto x : Events) {
    puts(x.first);
}
}
