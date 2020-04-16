//
//  OrderListCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/16.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "OrderListCell.h"

@implementation OrderListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   // self.state.textInsets = UIEdgeInsetsMake(5, 5, 0, 0);
    [self.state setViewBorderCornerRadius:2 borderWidth:0 borderColor:UIColor.clearColor];
    self.number.textColor  = YTYRGBA(131, 58, 113, 1);
    [self.number setViewBorderCornerRadius:0 borderWidth:1 borderColor:YTYRGBA(131, 58, 113, 1)];
    self.orderId.textColor  = YTYRGBA(131, 58, 113, 1);
    self.orderId.font = [UIFont systemFontOfSize:13 weight:UIFontWeightBold];
    
     [self.phoneNumber setRangeOfString:@" " lineSpacing:6 firstFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:12] tailColor:UIColor.grayColor];
    [self.place setRangeOfString:@" " lineSpacing:6 firstFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:12] tailColor:UIColor.grayColor];
    [self.driver setRangeOfString:@" " lineSpacing:6 firstFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:12] tailColor:UIColor.grayColor];
    [self.memorandum setRangeOfString:@" " lineSpacing:6 firstFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] firstColor:UIColor.blackColor tailFont:[UIFont systemFontOfSize:12] tailColor:UIColor.grayColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame {
    frame.origin.y += 15;
    frame.size.height -= 15;
    [super setFrame:frame];
}
@end
