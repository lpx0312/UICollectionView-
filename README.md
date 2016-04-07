##情景
   * 今天我在做一个相册选择问题中，发现当点击第一个cell时~cell中but的图片发生改变了~但是继续往下滑的时候~就出现了~问题~我只点击了~一个但是 下面的cell的中btn的图片也改变了~
***
  ![collectionView重用出错的效果图](http://upload-images.jianshu.io/upload_images/1418424-e2dace05ceeeb227.gif?imageMogr2/auto-orient/strip)

* 没有点击下面的但是 还是被勾选了  collectionView的重用出现了问题

##解决方法

*  使用一个数组 flagArr 存储所有cell的状态
*  把indexPath.row 和这个数组flagArr 传入cell中 然后进行赋值
* 根据点击的cell 进行判断然后给flagArr数组进行数据的更新

##具体实现
*  ->  viewDidLoad中

```
//初始化flagArr
    self.flagArr=[NSMutableArrayarray]; 
   //初始化数据源    self.dataArr=[NSMutableArrayarray];   
  for (int i=0; i<80; i++) {       
  [self.dataArraddObject:[NSStringstringWithFormat:@"%d",i]];      
  //把flagArr 的个数和数据源的个数设置成相同的      
  //而且用0初始化~也就是一开始 cell的状态全都是未选中        
    [self.flagArraddObject:@"0"];
    }
```
* -> cellForRow或者cellForItem中 （第三问）

```
 //把indexPath.row 和 flagArr传进去
       [cell config:indexPath.row andData:self.flagArr];
```

* ->cell中

```
-(void)config:(NSInteger)index andData:(NSMutableArray*)flagArr;
{   
 //给需要点击cell改变的状态的控件设置tag    
//为了能在外面取到  然后通过点击cell给控件改变状态和属性    
self.selectImageView.tag=8888+index;    
//赋值判断:如果在index位置的值为0  就是未被选中  1就是被选中  
  if ([flagArr[index] intValue]){     
   self.selectImageView.image=[UIImageimageNamed:@"FriendsSendsPicturesSelectBigYIcon"];   
 }else {        
  self.selectImageView.image=[UIImageimageNamed:@"FriendsSendsPicturesSelectBigNIcon"];
    }
}
```

* ->控制器的 didSelected 点击cell的方法中

```
//一答：点击item响应的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{   
 //这个是关键通过indexPath 拿到这个cell 这个方法我老师忘记    
UICollectionViewCell * cell =[collectionView cellForItemAtIndexPath:indexPath];  
  //拿到这个cell中的控件   
 UIImageView * selICon=(UIImageView *)[cell viewWithTag:8888+indexPath.row];   
 //通过indexPath。row 取到这个cell的状态 0就是未被选中，1就是已经被选中了   
 int cellFlag=[[self.flagArrobjectAtIndex:indexPath.row] intValue];    
if (cellFlag) {        
[self.flagArrsetObject:@"0"atIndexedSubscript:indexPath.row];        
selICon.image=[UIImageimageNamed:@"FriendsSendsPicturesSelectBigNIcon"];    
}else {   
    [self.flagArrsetObject:@"1"atIndexedSubscript:indexPath.row];        
selICon.image=[UIImageimageNamed:@"FriendsSendsPicturesSelectBigYIcon"];  
  }
}
```

####现在你在运行的话`UICollectionView`或者`UITableView`的重用问题就解决了哦~~

参考Demo：[GitHub]()


