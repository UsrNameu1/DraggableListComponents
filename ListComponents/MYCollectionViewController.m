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

/**
 *  セル再利用のための識別子
 */
static NSString *const CellReuseIdentifier = @"MYAnimalCollectionViewCellReuseIdentifier";

@interface MYCollectionViewController () <UICollectionViewDataSource_Draggable, UICollectionViewDelegate>

/**
 *  動物モデル管理リポジトリ
 */
@property (nonatomic) MYAnimalRepository *repository;

/**
 *  編集中かどうか表します
 */
@property (nonatomic) BOOL editing;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)collectionViewDidTap:(id)sender;

@end

@implementation MYCollectionViewController

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _repository = [MYAnimalRepository new];
        [self.repository loadDefaultAnimals];
        
        self.editing = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ドラッグできるかどうか決められます
    self.collectionView.draggable = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UILongPressGestureRecognizer *longPressGestureRecognizer =
    [self longPressGestureRecognizerForCollectionView];
    
    [longPressGestureRecognizer addTarget:self
                                   action:@selector(collectionViewDidLongPress:)];
}

- (void)viewDidDisappear:(BOOL)animated
{
    UILongPressGestureRecognizer *longPressGestureRecognizer =
    [self longPressGestureRecognizerForCollectionView];
    
    [longPressGestureRecognizer removeTarget:self
                                      action:@selector(collectionViewDidLongPress:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.repository.animals.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MYAnimalCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifier
                                              forIndexPath:indexPath];
    cell.animal = self.repository.animals[indexPath.row];
    cell.vibrating = self.editing;
    
    return cell;
}

#pragma mark - UICollectionViewDataSource_Draggable

/**
 *  コレクションビュー内のセルがドラッグして移動した時に呼ばれます
 *
 *  @param collectionView ドラッグ対象コレクションビュー
 *  @param fromIndexPath  移動元セルインデックスパス
 *  @param toIndexPath    移動先セルインデックスパス
 */
- (void)collectionView:(UICollectionView *)collectionView
   moveItemAtIndexPath:(NSIndexPath *)fromIndexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    //モデルに順序入れ替えの指示を出します。
    [self.repository moveAnimalAtIndex:fromIndexPath.row
                               toIndex:toIndexPath.row];
}

/**
 *  指定インデックスパスのセルをドラッグで動かしていいかどうか問い合わせます
 *
 *  @param collectionView ドラッグ対象コレクションビュー
 *  @param indexPath      ドラッグ対象セルインデックスパス
 *
 *  @return 動かしていいかどうか
 */
- (BOOL)collectionView:(UICollectionView *)collectionView
canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/**
 *  指定インデックスパスのセルが移動先のセルに動かせるかどうかが決められます
 *
 *  @param collectionView ドラッグ対象コレクションビュー
 *  @param indexPath      移動元セルのインデックスパス
 *  @param toIndexPath    移動先セルのインデックスパス
 *
 *  @return 動かせるかどうか
 */
- (BOOL)collectionView:(UICollectionView *)collectionView
canMoveItemAtIndexPath:(NSIndexPath *)indexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    return YES;
}

#pragma mark - Handler methods

- (IBAction)collectionViewDidTap:(UITapGestureRecognizer *)sender
{
    [self changeEditingState:NO];
}

- (void)collectionViewDidLongPress:(UILongPressGestureRecognizer *)sender
{
    UIGestureRecognizerState state = sender.state;
    if (state == UIGestureRecognizerStateBegan &&
        !self.editing) {
        [self changeEditingState:YES];
    }
}

#pragma mark - Private methods

- (void)changeEditingState:(BOOL)editing
{
    self.editing = editing;
    
    [self changeVisibleCellsVibrating:editing];
}

- (void)changeVisibleCellsVibrating:(BOOL)vibrating
{
    NSArray *cells = [self.collectionView visibleCells];
    
    for (MYAnimalCollectionViewCell *cell in cells) {
        cell.vibrating = vibrating;
    }
}

/**
 *  コレクションビューからドラッグの挙動を制御するLongPressGestureRecognizerを抜き出します
 *
 *  @return ドラッグのLongPressGestureRecognizer
 */
- (UILongPressGestureRecognizer *)longPressGestureRecognizerForCollectionView
{
    NSArray *recognizers = self.collectionView.gestureRecognizers;
    
    UILongPressGestureRecognizer *longPressGestureRecognizer;
    
    for (UIGestureRecognizer *recognizer in recognizers) {
        if ([recognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
            longPressGestureRecognizer = (UILongPressGestureRecognizer *)recognizer;
        }
    }
    
    return longPressGestureRecognizer;
}

@end
