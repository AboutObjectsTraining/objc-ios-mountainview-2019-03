// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)testCreatePerson {
    Person *person = [[Person alloc] init];
    [person setFirstName:@"Fred"];
    [person setLastName:@"Smith"];
    [person setAge: 32];
    NSLog(@"%@", person);
}

- (void)testDesignatedInitializer {
    Person *person = [[Person alloc] initWithFirstName:@"Fred" lastName:@"Smith" age:32];
    NSLog(@"%@", person);
}

@end
