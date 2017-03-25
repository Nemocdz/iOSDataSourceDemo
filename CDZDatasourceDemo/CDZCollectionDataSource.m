//
//  CDZCollectionDataSource.m
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZCollectionDataSource.h"
#import "CDZCellProtocol.h"
@interface CDZCollectionDataSource()
@property (nonatomic ,strong) NSMutableDictionary *cellDic;
@end

@implementation CDZCollectionDataSource


- (instancetype)init{
    if (self = [super init]) {
        _sectionsArray = [NSMutableArray array];
    }
    return self;
}

- (void)setCellClass:(Class)cellClass forItemClass:(Class)itemClass{
    if (!itemClass || !cellClass) {
        return;
    }
    [self.cellDic setObject:cellClass forKey:NSStringFromClass(itemClass)];
}



- (id)collectionView:(UICollectionView *)collectionView itemForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sectionsArray.count > indexPath.section) {
        if (self.sectionsArray[indexPath.section].itemsArray.count > indexPath.row) {
            return self.sectionsArray[indexPath.section].itemsArray[indexPath.row];
        }
    }
    return nil;
}

- (Class)collectionView:(UICollectionView *)collectionView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = [self collectionView:collectionView itemForRowAtIndexPath:indexPath];
    Class cellClass = [self.cellDic objectForKey:NSStringFromClass([item class])];
    if (!cellClass) {
        cellClass = [UICollectionViewCell class];
    }
    return cellClass;
}

- (void)clearAllItems {
    self.sectionsArray = [NSMutableArray array];
}

- (CDZSectionObject *)firstSection{
    if (!_firstSection) {
        _firstSection = [[CDZSectionObject alloc]init];
        [self.sectionsArray addObject:_firstSection];
    }
    return _firstSection;
}

- (NSMutableDictionary *)cellDic{
    if (!_cellDic) {
        _cellDic = [NSMutableDictionary dictionary];
    }
    return _cellDic;
}


#pragma mark - UICollectionViewDataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView<CDZCustomView> *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:self.sectionsArray[indexPath.section].headerReuseIdentifer forIndexPath:indexPath];
        if ([view respondsToSelector:@selector(setItem:)]) {
            [view setItem:self.sectionsArray[indexPath.section]];
        }
        return view;
    }
    return nil;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.sectionsArray.count > section) {
        return self.sectionsArray[section].itemsArray.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self collectionView:collectionView cellClassForRowAtIndexPath:indexPath];
    UICollectionViewCell<CDZCollectionCell> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(setItem:)]) {
        [cell setItem:[self collectionView:collectionView itemForRowAtIndexPath:indexPath]];
    }
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sectionsArray ? self.sectionsArray.count : 0;
}


@end
