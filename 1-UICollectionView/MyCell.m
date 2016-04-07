//
//  MyCell.m
//  1-UICollectionView
//
//  Created by xiang_jj on 15/9/19.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import "MyCell.h"
@interface MyCell ()
/** 背景图片 **/
@property(nonatomic,strong)UIImageView * bgImageView;

@end

@implementation MyCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgImageView.frame=frame;
        self.backgroundView= self.bgImageView;
        self.selectImageView.image=[UIImage imageNamed:@"FriendsSendsPicturesSelectBigNIcon@2x"];
        self.selectImageView.frame=CGRectMake(20, 20, 40, 40);
        [self.contentView addSubview:self.selectImageView];
    }
    return self;
}


-(void)config:(NSInteger)index andData:(NSMutableArray*)flagArr;
{
    //给需要 点击cell改变的状态的控件设置tag
    //为了能在外面取到  然后通过点击cell给控件改变状态和属性
    self.selectImageView.tag=8888+index;
    //赋值判断:如果在index位置的值为0  就是未被选中  1就是被选中
    if ([flagArr[index] intValue]){
        self.selectImageView.image=[UIImage imageNamed:@"FriendsSendsPicturesSelectBigYIcon"];
    }else {
        self.selectImageView.image=[UIImage imageNamed:@"FriendsSendsPicturesSelectBigNIcon"];
    }
}

#pragma mark ---- 懒加载
-(UIImageView *)bgImageView
{
    if(!_bgImageView){
        _bgImageView=[[UIImageView alloc] init];
       _bgImageView.image = [UIImage imageNamed:@"heart"];
    }
    return _bgImageView;
}

-(UIImageView *)selectImageView
{
    if(!_selectImageView){
        _selectImageView=[[UIImageView alloc] init];
    }
    return _selectImageView;
}
@end









