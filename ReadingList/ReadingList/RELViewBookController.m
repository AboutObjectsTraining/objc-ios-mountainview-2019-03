// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELViewBookController.h"
#import "RLMBook.h"
#import "RLMAuthor.h"

@interface RELViewBookController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@end

@implementation RELViewBookController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self populateLabels];
}

- (void)populateLabels {
    self.titleLabel.text = self.book.title;
    self.yearLabel.text = self.book.year;
    self.firstNameLabel.text = self.book.author.firstName;
    self.lastNameLabel.text = self.book.author.lastName;
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
    // Intentionally left blank
}

@end
