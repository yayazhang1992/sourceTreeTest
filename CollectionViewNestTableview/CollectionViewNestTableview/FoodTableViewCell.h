//
//  FoodTableViewCell.h
//  CollectionViewNestTableview
//
//  Created by zhen zhu wang on 17/11/1.
//  Copyright © 2017年 ZYY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodModel.h"
@interface FoodTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *foodNameLabel;

-(void)setModel:(FoodModel*)foodModel;
@end
