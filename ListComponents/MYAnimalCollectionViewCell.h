//
//  MYAnimalCollectionViewCell.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/23.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MYAnimal;

/**
 *  動物に関する情報を表示するためのCollectionViewセルです。
 */
@interface MYAnimalCollectionViewCell : UICollectionViewCell

/**
 *  表示対象の動物
 */
@property (nonatomic) MYAnimal *animal;

/**
 *  セルが揺れているかどうかを決定します
 */
@property (nonatomic) BOOL vibrating;

/**
 *  揺れるアニメーションの半周期時間です (初期値0.15f)
 */
@property (nonatomic) NSTimeInterval vibratingTimeHalfInterval;

/**
 *  揺れるアニメーションの最大角です (初期値1.0f)
 */
@property (nonatomic) CGFloat maximumVibratingAngle;

@end
