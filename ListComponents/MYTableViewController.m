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

#import "MYAnimalTableViewCell.h"

#import "BVReorderTableView.h"

static NSString *const CellReuseIdentifier = @"MYAnimalTableViewCellReuseIdentifier";

@interface MYTableViewController () <ReorderTableViewDelegate>

@property (nonatomic) MYAnimalRepository *repository;

@end

@implementation MYTableViewController

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _repository = [MYAnimalRepository new];
        [self.repository loadDefaultAnimals];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ReorderTableViewDelegate

- (id)saveObjectAndInsertBlankRowAtIndexPath:(NSIndexPath *)indexPath
{
    //セルの入れ替えの際に生じる空のセルを処理するために、空のセル用のオブジェクトを用意して
    //もともとの配列モデルの要素と入れ替えます。返り値として元のオブジェクトを返し、保存します。
    NSUInteger saveAnimalIndex = indexPath.row;
    MYAnimal *savedAnimal = self.repository.animals[saveAnimalIndex];
    
    MYAnimal *blankAnimal = [MYAnimalFactory new].blankAnimal;
    [self.repository replaceAnimalAtIndex:saveAnimalIndex withAnimal:blankAnimal];
    return savedAnimal;
}

- (void)moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
               toIndexPath:(NSIndexPath *)toIndexPath
{
    //モデルに順序入れ替えの指示を出します。
    [self.repository moveAnimalAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

- (void)finishReorderingWithObject:(MYAnimal *)animal atIndexPath:(NSIndexPath *)indexPath
{
    //元のオブジェクトを復元します。
    [self.repository replaceAnimalAtIndex:indexPath.row withAnimal:animal];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repository.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MYAnimalTableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier
                                    forIndexPath:indexPath];
    
    cell.animal = self.repository.animals[indexPath.row];
    
    return cell;
}

@end
