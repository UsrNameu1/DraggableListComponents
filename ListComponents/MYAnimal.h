//
//  MYAnimal.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  動物を表すVOクラス
 */
@interface MYAnimal : NSObject

/**
 *  動物の名前
 */
@property (nonatomic, readonly) NSString *name;

/**
 *  動物の年齢
 */
@property (nonatomic, readonly) NSInteger age;

/**
 *  指定イニシャライザ
 *
 *  @param dictionary @{@"name" : @"動物名", @"age" : @"動物の年齢"}形式のNSDictionary
 *
 *  @return インスタンス
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
