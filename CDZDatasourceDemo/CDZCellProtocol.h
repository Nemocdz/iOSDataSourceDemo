//
//  CDZCellProtocol.h
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CDZCustomView
@required

- (void)setItem:(id)item;

@end

@protocol CDZTableCell <CDZCustomView>
@required

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(id)item;

@end


@protocol  CDZCollectionCell <CDZCustomView>
@required

+ (CGSize)collectionView:(UICollectionView *)collectionView sizeForItem:(id)item;

@end

