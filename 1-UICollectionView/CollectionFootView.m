//
//  CollectionFootView.m
//  1-UICollectionView
//
//  Created by xiang_jj on 15/9/19.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import "CollectionFootView.h"

@implementation CollectionFootView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%lf %lf %lf %lf",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        label.backgroundColor= [UIColor redColor];
        label.text = @"Section的尾部视图";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
    }
    return self;
}
@end
