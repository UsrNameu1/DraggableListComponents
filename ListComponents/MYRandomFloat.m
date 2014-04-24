//
//  MYRandomFloat.c
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/24.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYRandomFloat.h"

CGFloat CGFloatMakeInRandomWithMaximumFloat(CGFloat maximumFloat)
{
    return (CGFloat)arc4random()/(CGFloat)RAND_MAX * maximumFloat;
}