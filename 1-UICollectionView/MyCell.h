//
//  MyCell.h
//  1-UICollectionView
//
//  Created by xiang_jj on 15/9/19.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Myblock)();
@interface MyCell : UICollectionViewCell

/** SelectImage */
@property (nonatomic,strong)UIImageView * selectImageView;

-(void)config:(NSInteger)index andData:(NSMutableArray*)flagArr;

@end









