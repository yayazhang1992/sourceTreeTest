//
//  ViewController.m
//  CollectionViewNestTableview
//
//  Created by zhen zhu wang on 17/10/31.
//  Copyright © 2017年 ZYY. All rights reserved.
//

#import "ViewController.h"
#import "Define.h"
#import "OrderModel.h"
#import "FoodModel.h"
#import "OrderCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollectionView];
}
-(void)createCollectionView {
    UICollectionViewFlowLayout *customflowLayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, KW, KH-64) collectionViewLayout:customflowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[OrderCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCellID"];
    [self.view addSubview:_collectionView];
}
-(NSMutableArray*)orderArr {
    if (_orderArr == nil) {
        _orderArr = [NSMutableArray new];
        
        for (int i = 1; i<20; i++) {
            OrderModel *orderModel = [[OrderModel alloc]init];
            orderModel.deskNum = [NSString stringWithFormat:@"桌号%d",i];
            orderModel.orderDate = @"2017-11-1-12-10";
            orderModel.remark = @"不错呀";
            orderModel.assistant = [NSString stringWithFormat:@"服务员%d",i];
            orderModel.foodModelList = [NSMutableArray new];
            int foodNum = arc4random()%10;
            if (foodNum<2) {
                foodNum = 2;
            }
            for (int k = 1; k < foodNum; k++) {
                FoodModel *foodModel = [[FoodModel alloc]init];
                foodModel.foodName = [NSString stringWithFormat:@"菜品%d",k];
                [orderModel.foodModelList addObject:foodModel];
            }
          
            [_orderArr addObject:orderModel];
        }
 
    }
    
    return _orderArr;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
 
    NSLog(@"%ld",self.orderArr.count);
    return self.orderArr.count;
}  

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    OrderModel *orderModel = _orderArr[indexPath.row];
    CGFloat height = orderModel.foodModelList.count * 40;
    if (height<160) {
        height = 160;
    }
    return CGSizeMake(KW, height);
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OrderCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCellID" forIndexPath:indexPath];
    OrderModel *model = _orderArr[indexPath.row];
    [collectionViewCell configData:model];
    return collectionViewCell;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
