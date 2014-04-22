//
//  MYAnimal.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYAnimal.h"

@implementation MYAnimal

#pragma mark - Lifecycle methods

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _age = [dictionary[@"age"] integerValue];
    }
    return self;
}

@end
