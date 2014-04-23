//
//  MYAnimalCollectionViewCell.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/23.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYAnimalCollectionViewCell.h"

#import "MYAnimal.h"

static const CGFloat BackgroundViewCornerRadius = 3.0f;

@interface MYAnimalCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation MYAnimalCollectionViewCell

#pragma mark - Lifecycle methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundView.layer.cornerRadius = BackgroundViewCornerRadius;
}

#pragma mark - Accessor methods

- (void)setAnimal:(MYAnimal *)animal
{
    _animal = animal;
    
    self.nameLabel.text = animal.name;
    [self.nameLabel sizeToFit];
    self.ageLabel.text = [@(animal.age) stringValue];
    [self.ageLabel sizeToFit];
}

@end
