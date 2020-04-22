//
//  AreaHeadView.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTYLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AreaHeadView : UIView


/**
        
     self.info.text = @"當前區域基本資料";
     self.icon.image = [UIImage imageNamed:@"区域"];
     self.date.text = @"最後更新時間\n 4/10/19 18:20";
     self.area.text = @"Area1";
     self.cbm.text = @"目前可用CBM\n100/300";
     self.name.text = @"所屬\n倉庫1";
 
          @"twoPlace" // 变成两个label
 */

@property (strong, nonatomic) NSDictionary *dicValue;


@end

NS_ASSUME_NONNULL_END
