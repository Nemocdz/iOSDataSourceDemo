//
//  ViewController.m
//  CDZDatasourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "ViewController.h"

#import "CDZSectionObject.h"
#import "CDZCellItem.h"

#import "CDZTableDataSource.h"
#import "CDZTableViewCell.h"

#import "CDZCollectionDataSource.h"
#import "CDZCollectionViewCell.h"

@interface ViewController ()<UITableViewDelegate, UICollectionViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CDZTableDataSource *tableDataSource;

@property (nonatomic, strong) UICollectionView *collecitonView;
@property (nonatomic, strong) CDZCollectionDataSource *collectionDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.view addSubview:self.tableView];
    [self.view addSubview:self.collecitonView];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self.tableDataSource tableView:tableView cellClassForRowAtIndexPath:indexPath];
    return (cellClass == [UITableViewCell class]) ? 44.f : [cellClass tableView:tableView rowHeightForItem:[self.tableDataSource tableView:tableView itemForRowAtIndexPath:indexPath]];
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self.tableDataSource;
    }
    return _tableView;
}

- (CDZTableDataSource *)tableDataSource{
    if (!_tableDataSource) {
        _tableDataSource = [[CDZTableDataSource alloc]init];
        [_tableDataSource setCellClass:[CDZTableViewCell class] forItemClass:[CDZCellItem class]];
        _tableDataSource.firstSection.itemsArray = [[self mockItems] copy];
    }
    return _tableDataSource;
}

- (NSArray *)mockItems{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++) {
        CDZCellItem *item = [[CDZCellItem alloc]init];
        [arrayM addObject:item];
    }
    return arrayM;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self.collectionDataSource collectionView:collectionView cellClassForRowAtIndexPath:indexPath];
    return (cellClass == [UICollectionViewCell class]) ? CGSizeMake(50, 50) : [cellClass collectionView:collectionView sizeForItem:[self.collectionDataSource collectionView:collectionView itemForRowAtIndexPath:indexPath]];
}

- (UICollectionView *)collecitonView{
    if (!_collecitonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collecitonView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
        _collecitonView.delegate = self;
        _collecitonView.dataSource = self.collectionDataSource;
        [_collecitonView registerClass:[CDZCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CDZCollectionViewCell class])];
    }
    return _collecitonView;
}


- (CDZCollectionDataSource *)collectionDataSource{
    if (!_collectionDataSource) {
        _collectionDataSource = [[CDZCollectionDataSource alloc]init];
        [_collectionDataSource setCellClass:[CDZCollectionViewCell class] forItemClass:[CDZCellItem class]];
        _collectionDataSource.firstSection.itemsArray = [[self mockItems] copy];
    }
    return _collectionDataSource;
}


@end
