//
//  MYAnimalFactory.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MYAnimal.h"

/**
 *  動物を生成するファクトリ
 */
@interface MYAnimalFactory : NSObject

/**
 *  デフォルトの動物配列
 */
@property (nonatomic, readonly) NSArray *defaultAnimals;

@end
