//
//  MYCollectionViewController.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYCollectionViewController.h"

#import "MYAnimalRepository.h"

#import "UICollectionView+Draggable.h"

#import "MYAnimalCollectionViewCell.h"

static NSString *const CellReuseIdentifier = @"MYAnimalCollectionViewCellReuseIdentifier";

@interface MYCollectionViewController () <UICollectionViewDataSource_Draggable, UICollectionViewDelegate>

@property (nonatomic) MYAnimalRepository *repository;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MYCollectionViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.draggable = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource_Draggable

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.repository.animals.count;
}

- (void)collectionView:(UICollectionView *)collectionView
   moveItemAtIndexPath:(NSIndexPath *)fromIndexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.repository moveAnimalAtIndex:fromIndexPath.row
                               toIndex:toIndexPath.row];
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView
canMoveItemAtIndexPath:(NSIndexPath *)indexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    return YES;
}

#pragma mark - UICollecitonViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MYAnimalCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifier
                                              forIndexPath:indexPath];
    cell.animal = self.repository.animals[indexPath.row];
    
    return cell;
}

@end
