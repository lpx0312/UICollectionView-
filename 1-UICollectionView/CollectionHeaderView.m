//
//  CollectionHeaderView.m
//  1-UICollectionView
//
//  Created by xiang_jj on 15/9/19.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import "CollectionHeaderView.h"

@implementation CollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.backgroundColor= [UIColor yellowColor];
        label.text = @"Section的头部视图";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
    }
    return self;
}

@end







