// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLCoolController.h"
#import "KWLCoolViewCell.h"

@implementation KWLCoolController

- (void)loadView {
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
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
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
