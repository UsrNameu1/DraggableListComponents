//
//  MYTableViewController.m
//  ListComponents
//
//  Created by adachi.yuichi on 2014/04/22.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

#import "MYTableViewController.h"

#import "MYAnimalDataSource.h"
#import "MYAnimalRepository.h"

#import "MYAnimalTableViewCell.h"

#import "BVReorderTableView.h"

/**
 *  セル再利用のための識別子
 */
static NSString *const CellReuseIdentifier = @"MYAnimalTableViewCellReuseIdentifier";

@interface MYTableViewController () <ReorderTableViewDelegate, UITableViewDataSource>

/**
 *  動物モデル管理リポジトリ
 */
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

/**
 *  順序入れ替えプロセスが始まった時に呼ばれるメソッドです。
 *  指定インデックスパスに応じてデータソースモデルにブランクオブジェクトを入れ、
 *  もともと入っていたオブジェクトを保存するために返り値として返します。
 *
 *  @param indexPath 入れ替えプロセスが始まった時にドラッグされたセルのインデックスパス
 *
 *  @return ドラッグ中のセルに入る一時的な保存対象のモデルオブジェクト
 */
- (id)saveObjectAndInsertBlankRowAtIndexPath:(NSIndexPath *)indexPath
{
    //セルの入れ替えの際に生じる空のセルを処理するために、空のセル用のオブジェクトを用意して
    //もともとの配列モデルの要素と入れ替えます。返り値として元のオブジェクトを返し、保存します。
    NSUInteger saveAnimalIndex = indexPath.row;
    MYAnimal *savedAnimal = self.repository.animals[saveAnimalIndex];
    
    MYAnimal *blankAnimal = [MYAnimalDataSource new].blankAnimal;
    [self.repository replaceAnimalAtIndex:saveAnimalIndex withAnimal:blankAnimal];
    return savedAnimal;
}

/**
 *  順序入れ替えプロセスの中で選択されたセルが新しい位置に収まった時に毎回呼ばれます。
 *  メソッドのコールに応じてデータソースモデルに順序入れ替えの指示をここで出します。
 *
 *  @param fromIndexPath 順序入れ替え元のセルインデックスパス
 *  @param toIndexPath   順序入れ替え先のセルインデックスパス
 */
- (void)moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
               toIndexPath:(NSIndexPath *)toIndexPath
{
    //モデルに順序入れ替えの指示を出します。
    [self.repository moveAnimalAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

/**
 *  順序入れ替えプロセスの最後、選択されたセルが最終的な位置に収まった時に呼ばれます。
 *  saveObjectAndInsertBlankRowAtIndexPathで保存されたオブジェクトが引数として返ってくるので、
 *  こちらのメソッド内でデータソースに挿入されたブランクオブジェクトと入れ替えてください。
 *
 *  @param animal    一時的にセーブされたモデルオブジェクト
 *  @param indexPath ドラッグされていたセルが最終的に収まる先のインデックスパス
 */
- (void)finishReorderingWithObject:(id)object atIndexPath:(NSIndexPath *)indexPath
{
    //元のオブジェクトを復元します。
    [self.repository replaceAnimalAtIndex:indexPath.row withAnimal:object];
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
