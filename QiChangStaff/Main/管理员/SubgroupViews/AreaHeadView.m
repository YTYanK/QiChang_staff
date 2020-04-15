//
//  AreaHeadView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "AreaHeadView.h"


@interface AreaHeadView()
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) YTYLabel *info;
@property (strong, nonatomic) UILabel *area;
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UILabel *cbm;
@property (strong, nonatomic) UILabel *date;
@end

@implementation AreaHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"???--%s",__func__);
    // 固定设置高度
//    frame = CGRectMake(0, 0, SCREEN_WIDTH, 140);
    self = [super initWithFrame:frame];
    if (self) {
        [self initAllView];
    }
    return self;
}

- (void)initAllView {
    self.backgroundColor = UIColor.whiteColor;
    self.info = [[YTYLabel alloc] initWithFrame:CGRectZero];
    self.info.backgroundColor = NAV_COLOR;
    self.info.textColor = UIColor.whiteColor;
    self.info.font = [UIFont systemFontOfSize:15];
    self.info.textInsets = UIEdgeInsetsMake(15, 18, 15.f, 0.f);
    [self addSubview:self.info];
    
    
    self.icon = [[UIImageView alloc] initWithImage:[UIImage new]];
    
    [self addSubview:self.icon];
    
    self.area = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.area];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectZero];
    self.name.numberOfLines = 2;
    [self addSubview:self.name];
    
    
    self.cbm = [[UILabel alloc] initWithFrame:CGRectZero];
    self.cbm.numberOfLines = 2;
    [self addSubview:self.cbm];
    
    
    self.date = [[UILabel alloc] initWithFrame:CGRectZero];
    self.date.numberOfLines = 2;
    [self addSubview:self.date];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(0);
        make.height.mas_equalTo(YTY_DP_375(32));
        make.width.equalTo(self.mas_width);
    }];

    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(self.info.mas_bottom).with.offset(16);
        make.height.mas_equalTo(YTY_DP_375(16.5));
        make.width.mas_equalTo(YTY_DP_375(14.5));
    }];
    
    
    [self.area mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.icon.mas_centerY);
        make.left.equalTo(self.icon.mas_right).with.offset(12);
        make.height.mas_equalTo(YTY_DP_375(16.5));
        make.width.equalTo(self).with.multipliedBy(0.5);
    }];
    

    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).with.offset(4);
        make.left.equalTo(self).with.offset(20);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);   //mas_equalTo(YTY_DP_375(50));
        make.width.equalTo(self).with.multipliedBy(0.3);
    }];
    [self.cbm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).with.offset(4);
        make.left.equalTo(self.name.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);   //mas_equalTo(YTY_DP_375(50));
        make.width.equalTo(self).with.multipliedBy(0.3);
    }];
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).with.offset(4);
        make.left.equalTo(self.cbm.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);   //mas_equalTo(YTY_DP_375(50));
        make.width.equalTo(self).with.multipliedBy(0.3);
    }];
    
}

- (void)updateAllData {
//    self.info.text = @"---";
//    self.icon.image = [UIImage imageNamed:@"区域"];
//    self.date.text = @"最後更新時間\n 4/10/19 18:20";
//    self.area.text = @"Area1";
//    self.cbm.text = @"目前可用CBM\n100/300";
//    self.name.text = @"所屬\n倉庫1";
    
    [self.name setRangeOfString:@"\n" lineSpacing:2 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:[UIColor blackColor]];

    NSRange range = [self.cbm.text rangeOfString:@"\n"];
    NSMutableAttributedString * mutStr = [self setMutableAttributesWithText:self.cbm.text];
    NSRange typeRange = {0,range.location};
    [mutStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:typeRange];
    [mutStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(range.location, [self.cbm.text length] - range.location)];
    [mutStr addAttribute:NSForegroundColorAttributeName value:YTYRGBA(81, 165, 216, 1) range:typeRange];
    [mutStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(range.location, [self.cbm.text length] - range.location)];
    [mutStr addAttribute:NSForegroundColorAttributeName value:YTYRGBA(221, 45, 50, 1) range:NSMakeRange(range.location, 4)];
    self.cbm.attributedText = mutStr;

    [self.date setRangeOfString:@"\n" lineSpacing:2 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:[UIColor blackColor]];
    
    
}
- (NSMutableAttributedString *)setMutableAttributesWithText:(NSString *)text  {
    NSMutableAttributedString * mutStr = [[NSMutableAttributedString alloc] initWithString:text];
    return mutStr;
}


- (void)setDicValue:(NSDictionary *)dicValue {
    if (_dicValue != dicValue) {
        _dicValue = dicValue;
        
        self.info.text = _dicValue[@"info"]; // @"當前區域基本資料";
        self.icon.image = [UIImage imageNamed:_dicValue[@"icon"]]; //@"区域"
        self.date.text = _dicValue[@"date"];//@"最後更新時間\n 4/10/19 18:20";
        self.area.text = _dicValue[@"area"];//@"Area1";
        self.cbm.text = _dicValue[@"cbm"];//@"目前可用CBM\n100/300";
        self.name.text = _dicValue[@"name"]; //@"所屬\n倉庫1";
        [self updateAllData];
    }
}


@end
