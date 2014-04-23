//
//  MYAnimalFactory.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MYAnimal;

/**
 *  動物を生成するファクトリ
 */
@interface MYAnimalFactory : NSObject

/**
 *  デフォルトの動物配列
 */
@property (nonatomic, readonly) NSArray *defaultAnimals;

/**
 *  空を表すアニマル（NSNullでの置き換えも可能かもしれない）
 */
@property (nonatomic, readonly) MYAnimal *blankAnimal;

@end
