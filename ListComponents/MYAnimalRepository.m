//
//  MYAnimalRepository.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYAnimalRepository.h"

#import "MYAnimalFactory.h"

@interface MYAnimalRepository ()

@property (nonatomic, readwrite) NSArray *animals;

@end

@implementation MYAnimalRepository

#pragma mark - Public methods

- (void)loadDefaultAnimals
{
    NSArray *defaultAnimals =
    [MYAnimalFactory new].defaultAnimals;
    
    self.animals = defaultAnimals;
}

- (void)moveAnimalAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    NSArray *beforeSortedAnimals = self.animals;
    NSMutableArray *afterSortedAnimals = beforeSortedAnimals.mutableCopy;
    
    MYAnimal *fromAnimal = afterSortedAnimals[fromIndex];
    [afterSortedAnimals removeObjectAtIndex:fromIndex];
    [afterSortedAnimals insertObject:fromAnimal
                             atIndex:toIndex];
    
    self.animals = [NSArray arrayWithArray:afterSortedAnimals];
}

- (void)replaceAnimalAtIndex:(NSUInteger)index
                  withAnimal:(MYAnimal *)animal
{
    NSMutableArray *animals = self.animals.mutableCopy;
    [animals replaceObjectAtIndex:index withObject:animal];

    self.animals = [NSArray arrayWithArray:animals];
}

@end
