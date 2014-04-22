//
//  MYAnimalFactory.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYAnimalFactory.h"

@implementation MYAnimalFactory

#pragma mark - Accessor methods

- (NSArray *)defaultAnimals
{
    static NSMutableArray *defaultAnimals;
    
    if (!defaultAnimals) {
        NSArray *defaultDatum =
        @[@{@"name" : @"dog", @"age" : @1},
          @{@"name" : @"cat", @"age" : @3},
          @{@"name" : @"elephant", @"age" : @100},
          @{@"name" : @"coara", @"age" : @10},
          @{@"name" : @"gozzila", @"age" : @30}];
        
        defaultAnimals = [NSMutableArray new];
        
        for (NSDictionary *defaultData in defaultDatum) {
            MYAnimal *animal = [[MYAnimal alloc] initWithDictionary:defaultData];
            [defaultAnimals addObject:animal];
        }
        
    }

    return [NSArray arrayWithArray:defaultAnimals];
}

@end
