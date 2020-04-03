//
//  WarehouseCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/3.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "WarehouseCell.h"

@implementation WarehouseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.area setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:UIColor.blackColor];
    [self.date setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:UIColor.blackColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame {
//    frame.origin.x += 10;//20;
    frame.origin.y += 15;
    frame.size.height -= 15;
//    frame.size.width -= 20;  // 40
    [super setFrame:frame];
}
@end
