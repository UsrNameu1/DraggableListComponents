//
//  MYTableViewController.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYTableViewController.h"

#import "UITableView+UINib.h"

#import "MYAnimalRepository.h"

#import "FMMoveTableView.h"
#import "MYAnimalCell.h"

static NSString *const CellReuseIdentifier = @"MYAnimalCellReuseIdentifier";

@interface MYTableViewController () <FMMoveTableViewDataSource, FMMoveTableViewDelegate>

@property (weak, nonatomic) IBOutlet FMMoveTableView *tableView;

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
    
    [self.tableView registerNibFromClass:[MYAnimalCell class]
                  forCellReuseIdentifier:CellReuseIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FMMoveTableViewDelegate

- (void)moveTableView:(FMMoveTableView *)tableView
 moveRowFromIndexPath:(NSIndexPath *)fromIndexPath
          toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.repository moveAnimalAtIndex:fromIndexPath.row
                               toIndex:toIndexPath.row];
}

#pragma mark - FMMoveTableViewDataSource

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
