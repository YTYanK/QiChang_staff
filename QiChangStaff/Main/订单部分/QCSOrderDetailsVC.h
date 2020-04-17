//
//  QCSOrderDetailsVC.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/16.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCSOrderDetailsVC : YTYBaseViewController
/// 获取状态 - 分别有三个 未派送、 已派送、已审核
@property (strong, nonatomic)  NSString *state;
/// 是否审核 - 如果审核过，页面布局进行调整及页面数据更新
@property (assign, nonatomic) BOOL isAudit;
@end

NS_ASSUME_NONNULL_END
