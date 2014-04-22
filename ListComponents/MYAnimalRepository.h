//
//  MYAnimalRepository.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  動物のデータ管理リポジトリ
 */
@interface MYAnimalRepository : NSObject

/**
 *  動物の配列、初期化時にはnil
 */
@property (nonatomic, readonly) NSArray *animals;

/**
 *  動物のデータをロード
 */
- (void)loadDefaultAnimals;

/**
 *  保持された配列の要素の順序を変更するメソッド
 *
 *  @param fromIndex 順序変更元の動物インデックス
 *  @param toIndex   順序変更先の動物インデックス
 */
- (void)moveAnimalAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
