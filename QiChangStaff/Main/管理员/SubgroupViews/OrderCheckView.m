//
//  OrderCheckView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/20.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "OrderCheckView.h"


@interface OrderCheckView()



@end


@implementation OrderCheckView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initAllView];
    }
    return self;
}
- (void)initAllView {
    
    self.backgroundColor = UIColor.greenColor;
//    self.backgroundColor = YTYRGBA(242, 242, 242, 1);
//
//    self.firstBgView = [[UIView alloc] initWithFrame:CGRectZero];
//    self.firstBgView.backgroundColor =  YTYRGBA(55, 141, 202,1);
//    [self addSubview:self.firstBgView];
//
//    self.mainView = [[UIView alloc] initWithFrame:CGRectZero];
//    self.mainView.backgroundColor = UIColor.whiteColor;
//    [self.mainView setViewBorderCornerRadius:6 borderWidth:1 borderColor:UIColor.whiteColor];
//    [self addSubview:self.mainView];
    
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.iconView.image  = [UIImage imageNamed:@"送货单"];
    [self addSubview:self.iconView];
    //
    
    self.title = [[UILabel alloc] initWithFrame:CGRectZero];
    self.title.font = [UIFont systemFontOfSize:15.0];
    self.title.textColor = NAV_COLOR;
    self.title.text = @"最新上傳送貨單";
    [self addSubview:self.title];
    
    self.checkView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.checkView.backgroundColor = UIColor.redColor;
    [self addSubview:self.checkView];
    
    
    
 
}


-(void)layoutSubviews {
    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self).with.offset(10);
         make.left.equalTo(self).with.offset(10);
         make.width.mas_offset(16);
         make.height.mas_offset(18);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self.iconView.mas_right).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.height.mas_offset(20);
    }];
    [self.checkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self).with.multipliedBy(0.8);
        make.bottom.equalTo(self).with.offset(-10);
    }];
    
}

@end
