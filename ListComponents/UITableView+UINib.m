//
//  UITableView+UINib.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "UITableView+UINib.h"

@implementation UITableView (UINib)

#pragma mark - Public methods

- (void)registerNibFromClass:(Class)cellClass
      forCellReuseIdentifier:(NSString *)identifier
{
    NSString *nibName = NSStringFromClass(cellClass);
    UINib *nib = [UINib nibWithNibName:nibName
                                bundle:nil];
    
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

- (void)registerNibFromClass:(Class)aClass
forHeaderFooterViewReuseIdentifier:(NSString *)identifier
{
    NSString *nibName = NSStringFromClass(aClass);
    UINib *nib = [UINib nibWithNibName:nibName
                                bundle:nil];
    
    [self registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
}

@end
