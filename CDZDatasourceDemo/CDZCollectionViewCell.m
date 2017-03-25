//
//  CDZCollectionViewCell.m
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZCollectionViewCell.h"
#import "CDZCellItem.h"

@implementation CDZCollectionViewCell

- (void)setItem:(id)item{
    //CDZCellItem *cellItem = (CDZCellItem *)item;
    self.contentView.backgroundColor = [UIColor blueColor];
    //解析cell数据
}

+ (CGSize)collectionView:(UICollectionView *)collectionView sizeForItem:(id)item{
    return CGSizeMake(100, 100);
}

@end
