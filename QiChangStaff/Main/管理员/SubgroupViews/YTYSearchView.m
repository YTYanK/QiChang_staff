//
//  YTYSearchView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYSearchView.h"
@interface YTYSearchView()<UITextFieldDelegate>

@end


@implementation YTYSearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initAllView];
    }
    return self;
}


- (void)initAllView {
     // 搜索
    self.searchField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.searchField.placeholder = @"搜索";
    self.searchField.backgroundColor = UIColor.whiteColor;



    CGFloat h = self.size.height * 0.4;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, h + 10,  h)];
    UIImageView * imageView= [[UIImageView alloc] initWithImage: [self image:[UIImage imageNamed:@"search"] ChangeColor:NAV_COLOR]];
    imageView.frame = CGRectMake(8, 0, h, h);//CGRectMake(12, -7, 12, 16);
    [leftView addSubview:imageView];
    leftView.backgroundColor = UIColor.clearColor;
    self.searchField.leftView = leftView;
    [self.searchField setViewBorderCornerRadius:3 borderWidth:0 borderColor:UIColor.clearColor];
    self.searchField.leftViewMode = UITextFieldViewModeAlways;
    self.searchField.delegate = self;
    [self addSubview:self.searchField];
    
    
     

}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).with.offset(0);
        make.centerX.equalTo(self).with.offset(0);
        make.height.equalTo(self).with.multipliedBy(0.7);
        make.width.equalTo(self).with.multipliedBy(0.96);
    }];
}



- (UIImage *)image:(UIImage *)imge  ChangeColor:(UIColor *)color {
    //获取画布
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    //画笔沾取颜色
    [color setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    //绘制一次
    [imge drawInRect:bounds blendMode:kCGBlendModeOverlay alpha:1.0f];
    //再绘制一次
    [imge drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    //获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


@end
