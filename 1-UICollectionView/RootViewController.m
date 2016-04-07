//
//  RootViewController.m
//  1-UICollectionView
//
//  Created by xiang_jj on 15/9/19.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import "RootViewController.h"
#import "MyCell.h"
#import "CollectionHeaderView.h"
#import "CollectionFootView.h"

@interface RootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray  * dataArr;
@property(nonatomic,strong)NSMutableArray * flagArr;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化flagArr
    self.flagArr=[NSMutableArray array];
    //初始化数据源
    self.dataArr=[NSMutableArray array];
    for (int i=0; i<80; i++) {
        [self.dataArr addObject:[NSString stringWithFormat:@"%d",i]];
        //把flagArr 的个数和数据源的个数设置成相同的
        //而且用0初始化~也就是一开始 cell的状态全都是未选中
        [self.flagArr addObject:@"0"];
    }

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //创建流式布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格（每一项）的大小（宽高）
    layout.itemSize = CGSizeMake(80, 80);
    //最小格间距（每个单元格之间的最小间距）
    layout.minimumInteritemSpacing = 10;
    //最小行间距
    layout.minimumLineSpacing = 10;
    //分区之间的边距
    layout.sectionInset = UIEdgeInsetsMake(80, 30, 80, 30);
    //设置滚动的方法(Vertical竖向)
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    UICollectionView  *cView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:layout];
    cView.delegate = self;
    cView.dataSource = self;
    cView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cView];
    //注册Cell
    [cView registerClass:[MyCell class] forCellWithReuseIdentifier:@"cellName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//???
#pragma mark - UICollectionViewDataSource
//1问 有几个分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//2问 每个分区有多少项
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 80;
}

//3问 每一项长什么样子
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从复用池里去取有没有符合要求的单元格，如果没有，自己创建一个cell返回
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellName" forIndexPath:indexPath];
    //把indexPath.row 和 flagArr传进去
    [cell config:indexPath.row andData:self.flagArr];
    return cell;
}

//一答：点击item响应的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //这个是关键 通过indexPath 拿到这个cell 这个方法我老师忘记
    UICollectionViewCell * cell =[collectionView cellForItemAtIndexPath:indexPath];
    //拿到这个cell中的控件
    UIImageView * selICon=(UIImageView *)[cell viewWithTag:8888+indexPath.row];
    //通过indexPath。row 取到这个cell的状态 0就是未被选中，1就是已经被选中了
    int cellFlag=[[self.flagArr objectAtIndex:indexPath.row] intValue];
    if (cellFlag) {
        [self.flagArr setObject:@"0" atIndexedSubscript:indexPath.row];
        selICon.image=[UIImage imageNamed:@"FriendsSendsPicturesSelectBigNIcon"];
    }else {
        [self.flagArr setObject:@"1" atIndexedSubscript:indexPath.row];
        selICon.image=[UIImage imageNamed:@"FriendsSendsPicturesSelectBigYIcon"];
    }
}
@end
