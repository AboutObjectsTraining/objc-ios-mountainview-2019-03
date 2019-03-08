// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLAccessoryView.h"

@interface KWLAccessoryView () <UITextFieldDelegate>

@end

@implementation KWLAccessoryView

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
