//
//  UITableView+UINib.h
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (UINib)

- (void)registerNibFromClass:(Class)cellClass
      forCellReuseIdentifier:(NSString *)identifier;

- (void)registerNibFromClass:(Class)aClass
forHeaderFooterViewReuseIdentifier:(NSString *)identifier;

@end
