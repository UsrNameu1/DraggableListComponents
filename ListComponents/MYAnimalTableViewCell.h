//
//  MYAnimalTableViewCell.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MYAnimal;

/**
 *  動物に関する情報を表示するためのTableViewセルです。
 */
@interface MYAnimalTableViewCell : UITableViewCell

/**
 *  表示対象の動物
 */
@property (nonatomic) MYAnimal *animal;

@end
