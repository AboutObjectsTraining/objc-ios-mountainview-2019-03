// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolController.h"
#import "KWLCoolViewCell.h"

@interface KWLCoolController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIView *contentView;

@end

@implementation KWLCoolController

- (IBAction)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    KWLCoolViewCell *newCell = [[KWLCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)loadView1 {
    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
}

- (void)loadView2 {
    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
    self.view = topLevelObjs.firstObject;
}


- (void)XXXloadView {
    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(self.view.bounds, &accessoryRect, &contentRect, 90.0, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    [self.view addSubview:accessoryView];
    [self.view addSubview:contentView];
    
    contentView.clipsToBounds = YES;
    
    self.contentView = contentView;
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    // Controls
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 52, 260, 30)];
    [accessoryView addSubview:textField];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Enter some text";
    
    self.textField = textField;
    self.textField.delegate = self;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 285, 52);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Cool View Cells
    
    KWLCoolViewCell *subview1 = [[KWLCoolViewCell alloc] initWithFrame:CGRectMake(20, 20, 240, 40)];
    KWLCoolViewCell *subview2 = [[KWLCoolViewCell alloc] initWithFrame:CGRectMake(50, 90, 240, 40)];
    [contentView addSubview:subview1];
    [contentView addSubview:subview2];
    
    subview1.text = @"Cool View Cells Rock! 🎉";
    subview2.text = @"UIKit FTW!!! 🏆";
    
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end
