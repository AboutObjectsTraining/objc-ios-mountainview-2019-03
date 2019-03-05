// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#include <stdio.h>
#include "ANSICBasics.h"

float ConvertToFahrenheit(float);
void ShowFahrenheitConversion(float);

int foo = 42;

void RunANSICBasics01(void) {
    printf("In function: %s\n", __PRETTY_FUNCTION__);
    ShowFahrenheitConversion(0.0);
    ShowFahrenheitConversion(100.0);
    ShowFahrenheitConversion(30.0);
}
void ShowFahrenheitConversion(float celsiusTemperature) {
    float convertedValue = ConvertToFahrenheit(celsiusTemperature);
    printf("Celsius was %.1f, fahrenheit is %.1f\n", celsiusTemperature, convertedValue);
}


float ConvertToFahrenheit(float celsiusTemperature) {
    return celsiusTemperature * (F_SCALE / C_SCALE) + F_FREEZING_POINT;
}
