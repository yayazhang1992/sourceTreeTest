//
//  OrderModel.h
//  CollectionViewNestTableview
//
//  Created by zhen zhu wang on 17/10/31.
//  Copyright © 2017年 ZYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property(nonatomic,copy)NSString *deskNum;
@property(nonatomic,copy)NSString *remark;
@property(nonatomic,copy)NSString *orderDate;
@property(nonatomic,copy)NSString *assistant;
@property(nonatomic,strong)NSMutableArray *foodModelList;
@end
