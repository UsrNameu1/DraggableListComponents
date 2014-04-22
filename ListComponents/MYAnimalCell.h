//
//  MYAnimalCell.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FMMoveTableViewCell.h"

#import "MYAnimal.h"

@interface MYAnimalCell : FMMoveTableViewCell

@property (nonatomic) MYAnimal *animal;

@end
