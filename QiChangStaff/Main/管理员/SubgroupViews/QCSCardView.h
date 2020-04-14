//
//  QCSCardView.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/14.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^QCSCardViewBlock)(UIView * view);

/** 其昌 特殊卡片view */
@interface QCSCardView : UIView

@property (weak, nonatomic) QCSCardViewBlock viewBlock;

@end

NS_ASSUME_NONNULL_END
