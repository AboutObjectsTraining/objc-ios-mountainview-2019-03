// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ANSICBasics.h"

void reallyMessWithPointer(int **ref) {
    **ref += 10;
}

void messWithPointers(void) {
    int *inchesRef;
//    int **inchesRefRef;
    int inches = 18;
    
    inchesRef = &inches;
//    inchesRefRef = &inchesRef;
    
    *inchesRef += 3;
    
    reallyMessWithPointer(&inchesRef);
    
    printf("inches: %d, inchesRef: %p\n", inches, inchesRef);
    printf("address of inches: %p, address of inchesRef: %p\n", &inches, &inchesRef);
    printf("value of inchesRef is %d\n", *inchesRef);
    
    inchesRef -= 1;
    printf("value: %d, address: %p\n", *inchesRef, inchesRef);
    
//    for (char *s = (char *) inchesRef; ; s++) {
//        printf("address: %p, value: %s\n", s, s);
//    }
}


void messWithArrays(void) {
//    int foo[10];
    int numbers[10] = { 1, 2, 3, 4, 5, 6 };
    int *numbersRef = numbers;
    
    
    printf("Using subscripts\n");
    for (int i = 0; i < 10; i++) {
        printf("value is %d, address is %p\n", numbersRef[i], &numbersRef[i]);
    }
    
    printf("Using pointer arithmetic\n");
    for (; *numbersRef; numbersRef++) {
        printf("value is %d, address is %p\n", *numbersRef, numbersRef);
    }

    
//    for (int i = 0; i < 10; i++) {
//        printf("value is %d, address is %p\n", numbers[i], &numbers[i]);
//    }
    
//    for (int i = 0; i < 10; i++) {
//        printf("value is %d, address is %p\n", foo[i], &foo[i]);
//    }
}

char *killMeNow(const char s[]) {
    char *clone = malloc(strlen(s));
    strncpy(clone, s, strlen(s));
    clone[0] = 'J';
    
    return clone;
}

void screwWithFoo(char **s) {
    *s = "Bye, bye, Jello";
}

void messWithStrings(void) {
    char word[10] = { 'a', 98, 99 };
    printf("word is %s\n", word);
    
    char otherWord[] = "Hello World!";
    printf("otherWord is %s\n", otherWord);
    
    char *foo = "Hello World!";
    printf("foo is %s\n", foo);
    
    foo = otherWord;
//    otherWord = foo;
    
    char *bar = "Hello World!";
    printf("foo is %s\n", bar);
    
    otherWord[0] = 'J';
    printf("otherWord is %s\n", otherWord);
    
    printf("first char is %c\n", foo[0]);
    foo[0] = 'J';
    printf("first char is %c\n", foo[0]);
    
    screwWithFoo(&foo);
    printf("foo is %s\n", foo);

    killMeNow(otherWord);
    killMeNow(bar);
}

int main(int argc, const char * argv[]) {
    
//    printf("Hello World!\n");
    messWithStrings();
//    messWithArrays();
//    messWithPointers();
    
//    RunANSICBasics01();
//    RunANSICBasics02();
    
    return 0;
}
