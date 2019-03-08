// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolView.h"
#import "KWLCoolViewCell.h"

@interface KWLCoolView ()
@property (nonatomic, weak) IBOutlet UITextField *textField;
@end

@implementation KWLCoolView

- (IBAction)addCell {
    KWLCoolViewCell *newCell = [[KWLCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    [self addSubview:newCell];
}

@end
