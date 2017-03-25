//
//  CDZCollectionDataSource.h
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CDZSectionObject.h"

@interface CDZCollectionDataSource : NSObject<UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray<CDZSectionObject *> *sectionsArray;
@property (nonatomic, strong) CDZSectionObject *firstSection;

- (id)collectionView:(UICollectionView *)collectionView itemForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Class)collectionView:(UICollectionView *)collectionView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)setCellClass:(Class)cellClass forItemClass:(Class)itemClass;
- (void)clearAllItems;

@end
