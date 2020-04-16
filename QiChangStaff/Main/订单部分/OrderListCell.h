//
//  OrderListCell.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/16.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>
#import "YTYLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderListCell : YTYBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *orderId;
@property (weak, nonatomic) IBOutlet YTYLabel *state;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *driver;
@property (weak, nonatomic) IBOutlet UILabel *memorandum;

@end

NS_ASSUME_NONNULL_END
