// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"

@implementation Person

//- (instancetype)initWithFoo:(NSString *)foo {
//    if (!(self = [super init])) return nil;
//
//    <#// Initialization code#>
//
//    return self;
//}


+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    return [[self alloc] initWithFirstName:firstName lastName:lastName];
}

// Convenience initializer
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    return [self initWithFirstName:firstName lastName:lastName age:0];
}

// Designated initializer
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(NSUInteger)age {
    if (!(self = [super init])) return nil;
    
    _firstName = [firstName copy];
    _lastName = [lastName copy];
    _age = age;
    
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:
            @"Class: %@, "
            "name: %@, "
            "age: %@",
            [self class],
            [self fullName],
            @([self age])];
}

@end
