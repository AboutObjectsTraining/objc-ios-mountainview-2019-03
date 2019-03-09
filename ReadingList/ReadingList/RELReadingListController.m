// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELViewBookController.h"
#import "RELDataSource.h"

@interface RELReadingListController ()

@property (strong, nonatomic) IBOutlet RELDataSource *dataSource;

@end

@implementation RELReadingListController

- (IBAction)done:(UIStoryboardSegue *)segue {
    // TODO: Save and sync UI.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RELViewBookController *controller = segue.destinationViewController;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    controller.book = [self.dataSource bookAtIndexPath:indexPath];
}

@end


//@implementation RELReadingListController (RELDataManagement)
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 100;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
////    if (cell == nil) {
////        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Book Cell"];
////    }
//    cell.textLabel.text = [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
//    return cell;
//}
//
//@end
