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

- (NSString *)firstName {
    return _firstName;
}
- (void)setFirstName:(NSString *)newValue {
    _firstName = [newValue copy];
}

- (NSString *)lastName {
    return _lastName;
}
- (void)setLastName:(NSString *)newValue {
    _lastName = [newValue copy];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSUInteger)age {
    return _age;
}
- (void)setAge:(NSUInteger)newValue {
    _age = newValue;
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
