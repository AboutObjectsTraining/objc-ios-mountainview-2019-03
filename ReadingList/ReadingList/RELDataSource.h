// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>

@class RLMBook;

@interface RELDataSource : NSObject <UITableViewDataSource>

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;

@end

