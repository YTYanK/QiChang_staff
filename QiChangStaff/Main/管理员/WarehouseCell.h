//
//  WarehouseCell.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/3.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>

NS_ASSUME_NONNULL_BEGIN

@interface WarehouseCell : YTYBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *warehouseName;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end

NS_ASSUME_NONNULL_END
