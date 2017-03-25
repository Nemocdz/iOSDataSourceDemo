//
//  CDZTableDatasource.m
//  CDZDatasourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZTableDataSource.h"
#import "CDZCellProtocol.h"

@interface CDZTableDataSource()
@property (nonatomic ,strong) NSMutableDictionary *cellDic;
@end

@implementation CDZTableDataSource

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


- (id)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sectionsArray.count > indexPath.section) {
        if (self.sectionsArray[indexPath.section].itemsArray.count > indexPath.row) {
            return self.sectionsArray[indexPath.section].itemsArray[indexPath.row];
        }
    }
    return nil;
}

- (Class)tableView:(UITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = [self tableView:tableView itemForRowAtIndexPath:indexPath];
    Class cellClass = [self.cellDic objectForKey:NSStringFromClass([item class])];
    if (!cellClass) {
        cellClass = [UITableViewCell class];
    }
    return cellClass;
}

- (void)clearAllItems{
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


#pragma mark - UITableViewDatasoure
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self tableView:tableView cellClassForRowAtIndexPath:indexPath];
    UITableViewCell<CDZTableCell> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
    if (!cell) {
        cell = [[cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellClass)];
    }
    if ([cell respondsToSelector:@selector(setItem:)]) {
        [cell setItem:[self tableView:tableView itemForRowAtIndexPath:indexPath]];
    }
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.sectionsArray.count > section) {
        return self.sectionsArray[section].itemsArray.count;
    }
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionsArray ? self.sectionsArray.count : 0;
}


@end
