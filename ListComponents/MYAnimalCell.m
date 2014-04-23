//
//  MYAnimalCell.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYAnimalCell.h"

@interface MYAnimalCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation MYAnimalCell

#pragma mark - Lifecycle methods

- (void)awakeFromNib
{
    [super awakeFromNib];
}

#pragma mark - Accessor methods

- (void)setAnimal:(MYAnimal *)animal
{
    _animal = animal;
    
    self.nameLabel.text = animal.name;
    [self.nameLabel sizeToFit];
    
    if (animal.age == -1) {
        self.ageLabel.text = @"";
    } else {
        self.ageLabel.text = [@(animal.age) stringValue];
    }
    
    [self.ageLabel sizeToFit];
}

@end
