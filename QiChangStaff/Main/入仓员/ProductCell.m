//
//  ProductCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/30.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)arr:(UIButton *)sender {
    CGFloat num = [self.numberValue.text intValue];
    CGFloat i = num;
    if (num > 1) {
        i -= 1;
    }else {
        i = 1;
    }
    self.numberValue.text = [NSString stringWithFormat:@"%.f", i];
}
- (IBAction)add:(UIButton *)sender {
    CGFloat num = [self.numberValue.text intValue];
    CGFloat i = num;
    if (num < 99) {
        i += 1;
    }else {
        i = 99;
    }
    self.numberValue.text = [NSString stringWithFormat:@"%.f", i];
    
}

@end
