#include<stdint.h>
#include<cstring>

char *int8ToChar(const int8_t *int8Array) {
    // First, determine the length of the input array
    size_t length = 0;
    while (int8Array[length] != '\0') {
        length++;
    }

    // Allocate memory for the char array (+1 for null terminator)
    char *charArray = new char[length + 1];

    // Copy the int8_t values to char array
    memcpy(charArray, int8Array, length);

    // Null-terminate the char array
    charArray[length] = '\0';

    return charArray;
}

