//
//  CDZTableDataSource.h
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CDZSectionObject.h"

@interface CDZTableDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<CDZSectionObject *> *sectionsArray;
@property (nonatomic, strong) CDZSectionObject *firstSection;

- (id)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Class)tableView:(UITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)clearAllItems;
- (void)setCellClass:(Class)cellClass forItemClass:(Class)itemClass;

@end
