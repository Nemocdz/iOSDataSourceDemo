//
//  CDZSectionObject.m
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "CDZSectionObject.h"

@implementation CDZSectionObject
- (instancetype)init {
    if (self = [super init]) {
        _headerTitle = @"";
        _itemsArray = [NSMutableArray array];
    }
    return self;
}



@end
