//
//  OrderCollectionViewCell.m
//  CollectionViewNestTableview
//
//  Created by zhen zhu wang on 17/10/31.
//  Copyright © 2017年 ZYY. All rights reserved.
//

#import "OrderCollectionViewCell.h"
#import "Define.h"
#import "Masonry.h"
#import "FoodTableViewCell.h"
@implementation OrderCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self configLayoutWith:frame];
    return self;
}
-(void)configLayoutWith:(CGRect)frame {
    _deskNumLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_deskNumLabel];
    _orderdateLabel = [[UILabel alloc ]init];
    [self.contentView addSubview:_orderdateLabel];
    _assistantLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_assistantLabel];
    _remarkLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_remarkLabel];
  
    _foodTableView = [[UITableView alloc]initWithFrame:CGRectMake(KW/2, 5, KW/2, frame.size.height)];
    _foodTableView.dataSource = self;
    _foodTableView.delegate = self;
    _foodTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:_foodTableView];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    

    [_deskNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(5.0f);
        make.top.mas_equalTo(self.contentView.mas_top).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(160, 20));
    }];
    [_orderdateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(5.0f);
        make.top.mas_equalTo(_deskNumLabel.mas_bottom).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(160, 20));
    }];
    
    [_assistantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(5.0f);
        make.top.mas_equalTo(_orderdateLabel.mas_bottom).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(160, 20));
    }];
    
    [_remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(5.0f);
        make.top.mas_equalTo(_assistantLabel.mas_bottom).offset(5.0f);
        make.size.mas_equalTo(CGSizeMake(160, 20));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(5.0f);
        make.bottom.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(KW, 1));
    }];
   
}
-(void)configData:(OrderModel*)orderModel{
    _deskNumLabel.text = orderModel.deskNum;
    _orderdateLabel.text = orderModel.orderDate;
    _assistantLabel.text = orderModel.assistant;
    _remarkLabel.text = orderModel.remark;
    _foodDataSource = orderModel.foodModelList;
    NSLog(@"kkkkkk%ld",_foodDataSource.count);
    CGFloat height = orderModel.foodModelList.count * 40;
    if (height<160) {
        height = 160;
    }
    [_foodTableView   mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(5.0f);
        make.left.mas_equalTo(self.contentView.mas_left).offset(KW/2);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(KW);
    }];
    [_foodTableView reloadData];
}


  

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"mmmmmmmm%ld",_foodDataSource.count);
    return _foodDataSource.count;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell_sell_trade_identifier";
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[FoodTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault                                  reuseIdentifier:cellId];
        //这个方法仅限当cell的style是default的时候有效
    }
    FoodModel *foodModel = _foodDataSource[indexPath.row];
    [cell setModel:foodModel];
    return cell;


}














@end
