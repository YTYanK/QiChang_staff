//
//  DeliveryReportCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/14.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "DeliveryReportCell.h"

@implementation DeliveryReportCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     
    [self.icon setViewBorderCornerRadius:22 borderWidth:0 borderColor:UIColor.clearColor];
}
- (void)setFrame:(CGRect)frame {
         frame.origin.y += 15;
        frame.size.height -= 15;
        [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
