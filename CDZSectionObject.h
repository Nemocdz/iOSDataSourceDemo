//
//  CDZSectionObject.h
//  CDZDataSourceDemo
//
//  Created by Nemocdz on 2017/3/25.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDZSectionObject : NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *headerReuseIdentifer;

@property (nonatomic, strong) NSMutableArray *itemsArray;

@end
