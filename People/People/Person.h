// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                              age:(NSUInteger)age;

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, assign) NSUInteger age;

//- (NSString *)firstName;
//- (void)setFirstName:(NSString *)newValue;
//
//- (NSString *)lastName;
//- (void)setLastName:(NSString *)newValue;
//
//- (NSUInteger)age;
//- (void)setAge:(NSUInteger)newValue;

@end
