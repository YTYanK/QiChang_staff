//
//  ProductCollectCell.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/6.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>
#import "ProductView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductCollectCell : YTYBaseTableViewCell
@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UIImageView *icon;

@property (strong, nonatomic) UIButton *complete;

@property (strong, nonatomic) UILabel *state;

@property (strong, nonatomic) UILabel *area;


/// 列表
@property (strong, nonatomic) NSMutableArray<ProductView *> * productViews;


@property (strong, nonatomic) NSArray * btnTitles;

@end

NS_ASSUME_NONNULL_END
