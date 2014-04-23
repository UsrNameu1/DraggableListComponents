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
 *  動物に関する情報を表示するためのセルです。
 */
@interface MYAnimalTableViewCell : UITableViewCell

/**
 *  情報を表示する対象の動物
 */
@property (nonatomic) MYAnimal *animal;

@end
