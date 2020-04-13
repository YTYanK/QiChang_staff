//
//  RecordReceivingCell.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/13.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "RecordReceivingCell.h"
#import "YTYLabel.h"

@implementation RecordReceivingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    RecordReceivingCell *cell = self;
     UIImageView * icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"产品"]];
        [cell addSubview:icon];
        
        YTYLabel *title = [[YTYLabel alloc] initWithFrame:CGRectZero];
        title.backgroundColor = UIColor.redColor;
        title.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
        title.textColor = UIColor.blackColor;
        title.numberOfLines = 5;
        title.text = @"美國 'Solo' \"BARE\" 四安蒸餾水捲邊 尖杯(Eco-Forward) Packing: 1 x 25 boxes ";
    //    title.textInsets = UIEdgeInsetsMake(-10, 0, -10, 0);
    //    title.yf_contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        [cell addSubview:title];
        
        
        UIImageView * icon2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"仓库"]];
        [cell addSubview:icon2];
        
        UILabel *area = [[UILabel alloc] initWithFrame:CGRectZero];
        area.text =[NSString stringWithFormat:@"Area%ld",(long)self.indexPath.row];
        area.font = [UIFont systemFontOfSize:12];
        area.backgroundColor = UIColor.greenColor;
        [cell addSubview:area];
        
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectZero];
        type.numberOfLines = 2;
        type.text = [NSString stringWithFormat:@"產品種類\n紙杯"];
    //    type.backgroundColor = UIColor.greenColor;
        [cell addSubview:type];
         [type setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
        
        
        UILabel *number = [[UILabel alloc] initWithFrame:CGRectZero];
        number.numberOfLines = 2;
        number.text = [NSString stringWithFormat:@"產品數量\n10箱"];
    //    number.backgroundColor = UIColor.blueColor;
        [cell addSubview:number];
         [number setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
        
        CGFloat icon_wh = YTY_DP_375(16);
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell).with.offset(16);
            make.left.equalTo(cell).with.offset(20);
            make.height.mas_equalTo(icon_wh);
            make.width.mas_equalTo(icon_wh);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell).with.offset(16);
            make.left.equalTo(icon.mas_right).with.offset(10);
            make.width.equalTo(cell).with.multipliedBy(0.7);
        }];
        
    
    if(self.indexPath.section == 0) {
        [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell).with.offset(16);
            make.left.equalTo(title.mas_right).with.offset(10);
            make.height.mas_equalTo(icon_wh);
            make.width.mas_equalTo(icon_wh);
        }];
        [area mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell).with.offset(16);
            make.left.equalTo(icon2.mas_right).with.offset(5);
            make.right.equalTo(cell).with.offset(-5);
            make.height.mas_equalTo(22);
        }];
        [type mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(title.mas_bottom).with.offset(10);
           make.bottom.equalTo(cell).with.offset(-8);
           make.left.equalTo(cell).with.offset(20);
           make.width.equalTo(cell).with.multipliedBy(0.4);
        }];
        [number mas_makeConstraints:^(MASConstraintMaker *make) {
              make.top.equalTo(title.mas_bottom).with.offset(10);
              make.bottom.equalTo(cell).with.offset(-8);
              make.left.equalTo(type.mas_right).with.offset(5);
           make.right.equalTo(cell).with.offset(-20);
        }];
        
        
    }else {
        [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell).with.offset(0);
                make.left.equalTo(title.mas_right).with.offset(10);
                make.height.mas_equalTo(icon_wh);
                make.width.mas_equalTo(icon_wh);
            }];
            [area mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(icon2).with.offset(0);
                make.left.equalTo(icon2.mas_right).with.offset(5);
                make.right.equalTo(cell).with.offset(-5);
                make.height.mas_equalTo(22);
            }];
    }
    
    
       
    
    
    
}
- (void)setFrame:(CGRect)frame {
     if (self.indexPath.row == 0) {
         [super setFrame:frame];
     }else {
         frame.origin.y += 15;
        frame.size.height -= 15;
        [super setFrame:frame];
     }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
