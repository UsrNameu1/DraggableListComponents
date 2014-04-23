//
//  MYTableViewController.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYTableViewController.h"

#import "UITableView+UINib.h"

#import "MYAnimalFactory.h"
#import "MYAnimalRepository.h"

#import "MYAnimalCell.h"

#import "BVReorderTableView.h"

static NSString *const CellReuseIdentifier = @"MYAnimalCellReuseIdentifier";

@interface MYTableViewController () <ReorderTableViewDelegate>

@property (nonatomic) MYAnimalRepository *repository;

@end

@implementation MYTableViewController

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.repository = [MYAnimalRepository new];
        [self.repository loadDefaultAnimals];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ReorderTableViewDelegate

- (id)saveObjectAndInsertBlankRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [MYAnimalFactory new].blankAnimal;
}

- (void)moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
               toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.repository moveAnimalAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

- (void)finishReorderingWithObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repository.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MYAnimalCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier
                                    forIndexPath:indexPath];
    
    cell.animal = self.repository.animals[indexPath.row];
    
    return cell;
}

@end
