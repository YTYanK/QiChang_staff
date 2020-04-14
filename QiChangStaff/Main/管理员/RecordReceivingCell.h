//
//  RecordReceivingCell.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/13.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>
#import "YTYLabel.h"

NS_ASSUME_NONNULL_BEGIN
@interface RecordReceivingCell : YTYBaseTableViewCell


@property(strong, nonatomic) MASConstraint *areaTop;
@property(strong, nonatomic) MASConstraint *areaCenterY;


@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic)  UIImageView * icon;
@property (strong, nonatomic) YTYLabel *title;
@property (strong, nonatomic) UIImageView * icon2;
@property (strong, nonatomic) UILabel *area;
@property (strong, nonatomic)  UILabel *type;
@property (strong, nonatomic)  UILabel *number;


+ (instancetype)initCellWithCellView:(UITableView *)tableView reuseIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)index;
@end

NS_ASSUME_NONNULL_END
