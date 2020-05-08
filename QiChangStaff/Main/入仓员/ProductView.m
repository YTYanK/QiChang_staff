//
//  ProductView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductView.h"


@interface ProductView()
@property (strong, nonatomic)  UILabel *product;
@property (strong, nonatomic)  UILabel *number;
@property (strong, nonatomic)  UITextField *numberValue;
@end

@implementation ProductView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/





- (instancetype)initWithFrame:(CGRect)frame
{
//    NSString * frameStr = NSStringFromCGRect(frame);
//    NSString * zeroStr  = NSStringFromCGRect(CGRectZero);
//    NSString * nilStr  = NSStringFromCGRect(CGRectNull);
//    // zeroStr--->{{0, 0}, {0, 0}}, nilStr===>{{inf, inf}, {0, 0}}
//    if([frameStr isEqualToString:zeroStr]) {
//        frame = CGRectMake(frame.origin.x, frame.origin.y, SCREEN_WIDTH, 40);
//    }
    self = [super initWithFrame:frame];
    if (self) {
         [self initAllView];
         [self setAllSubViewLayout];
         [self updateAllData];
    }
    return self;
}

- (void)initAllView {
    self.addBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.addBtn.backgroundColor = NAV_COLOR;
    [self.addBtn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addBtn];
    
    self.arrBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.arrBtn.backgroundColor = NAV_COLOR;
    [self.arrBtn addTarget:self action:@selector(arr:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.arrBtn];
    
    
    self.product = [[UILabel alloc] initWithFrame:CGRectZero];
    self.product.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.product];
    
    self.number = [[UILabel alloc] initWithFrame:CGRectZero];
    self.number.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.number];
    
    self.numberValue = [[UITextField alloc] initWithFrame:CGRectZero];
    self.numberValue.backgroundColor = UIColor.whiteColor;
    self.numberValue.textAlignment = NSTextAlignmentCenter;
    self.numberValue.borderStyle =  UITextBorderStyleBezel;
    self.numberValue.enabled = NO;
    [self addSubview:self.numberValue];

}
- (void)setAllSubViewLayout {

    [self.product  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.width.equalTo(self).with.multipliedBy(0.4);
        make.height.equalTo(self);
    }];
    
    [self.number  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self.product.mas_right).offset(0);
        make.width.equalTo(self).with.multipliedBy(0.2);
        make.height.equalTo(self);
    }];
    
    [self.arrBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerY.equalTo(self);
           make.left.equalTo(self.number.mas_right).offset(0);
           make.width.mas_equalTo(25);
           make.height.mas_equalTo(25);
    }];
       [self.addBtn  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-20);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(25);
         }];
    [self.numberValue  mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerY.equalTo(self);
           make.height.equalTo(self.mas_height).multipliedBy(1);
           make.left.equalTo(self.arrBtn.mas_right).offset(4);
           make.right.equalTo(self.addBtn.mas_left).offset(-4);

    }];
}

- (void)updateAllData {    
    [self updateDataForDictionrary:@{@"product": @"---", @"number": @"0", @"numberValue" : @"1"}];
    [self.arrBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
    self.addBtn.titleEdgeInsets = UIEdgeInsetsMake(-3, -1, 0, 0);
    self.arrBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 0);
    
}



- (void)updateDataForDictionrary:(nonnull NSDictionary *)dic {
    self.product.text = [dic[@"product"] stringValue];
    self.number.text = [dic[@"number"] stringValue];
    self.numberValue.text = [dic[@"numberValue"] stringValue];
}

- (void)arr:(UIButton *)sender {
    CGFloat num = [self.numberValue.text intValue];
    CGFloat i = num;
    if (num > 1) {
        i -= 1;
    }else {
        i = 1;
    }
    self.numberValue.text = [NSString stringWithFormat:@"%.f", i];
}
- (void)add:(UIButton *)sender {
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
