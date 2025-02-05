#include<stdio.h>


int8_t* charToInt8(const char *charArray) {
    // First, determine the length of the input array
    size_t length = strlen(charArray);

    // Allocate memory for the int8_t array
    int8_t *int8Array = new int8_t[length + 1]; // +1 for null terminator

    // Copy each character to int8_t array
    for (size_t i = 0; i < length; ++i) {
        int8Array[i] = static_cast<int8_t>(charArray[i]);
    }

    // Null-terminate the int8_t array (optional, depending on use case)
    int8Array[length] = '\0'; // Only if you need a null terminator

    return int8Array;
}

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

int listEvents() {
    for (auto x : Events) {
        // if (x.second == 0) continue;
        // Events[x.first] = 0;
        return (x.first);
    }
    // return "NULL"
    return 2;
}


