//
//  AreaCell.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/3.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>

NS_ASSUME_NONNULL_BEGIN

@interface AreaCell : YTYBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *areaName;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UILabel *ascription;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *cbm;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ascriptionH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ascriptionW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ascriptionTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ascriptionBottom;


@end

NS_ASSUME_NONNULL_END
