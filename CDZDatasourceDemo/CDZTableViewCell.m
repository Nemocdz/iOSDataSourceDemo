//
//  CDZTableViewCell.m
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZTableViewCell.h"
#import "CDZCellItem.h"

@implementation CDZTableViewCell

- (void)setItem:(id)item{
    CDZCellItem *cellItem =  (CDZCellItem *)item;
    self.textLabel.text = cellItem.text;
    
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(id)item{
    return 60.f;
}

@end
