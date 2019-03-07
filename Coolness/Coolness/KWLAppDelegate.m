// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "KWLAppDelegate.h"
#import "KWLCoolController.h"

@implementation KWLAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.yellowColor;
    
    self.window.rootViewController = [[KWLCoolController alloc] init];
    
    [self.window makeKeyAndVisible];
}

@end
