//
//  OrderCollectionViewCell.h
//  CollectionViewNestTableview
//
//  Created by zhen zhu wang on 17/10/31.
//  Copyright © 2017年 ZYY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
#import "FoodModel.h"
@interface OrderCollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *deskNumLabel;
@property(nonatomic,strong)UILabel *remarkLabel;
@property(nonatomic,strong)UILabel *orderdateLabel;
@property(nonatomic,strong)UILabel *assistantLabel;
@property(nonatomic,strong)UITableView *foodTableView;
@property(nonatomic,strong)NSMutableArray *foodDataSource;
-(void)configData:(OrderModel*)orderModel;
@end
