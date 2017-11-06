//
//  FoodTableViewCell.m
//  CollectionViewNestTableview
//
//  Created by zhen zhu wang on 17/11/1.
//  Copyright © 2017年 ZYY. All rights reserved.
//

#import "FoodTableViewCell.h"
#import "Define.h"

@implementation FoodTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    //先调用父类的方法
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}


-(void)initView{
    _foodNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
//    _foodNameLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_foodNameLabel];
   
}

-(void)setModel:(FoodModel*)foodModel{
    _foodNameLabel.text = foodModel.foodName;
    
}
@end
