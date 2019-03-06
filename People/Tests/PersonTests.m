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
    
//    Person *clone = [person copy];
//    NSLog(@"%@", clone);
}

- (void)testNSString {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    NSMutableString *s3 = [NSMutableString alloc];
    NSMutableString *s4 = [NSMutableString alloc];
    s1 = [s1 initWithFormat:@"My %@", @"String"];
    s2 = [s2 initWithContentsOfFile:@"/tmp/Person.m" encoding:NSUTF8StringEncoding error:NULL];
    s3 = [s3 initWithContentsOfFile:@"/tmp/Person.m" encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@", s1);
}

@end
