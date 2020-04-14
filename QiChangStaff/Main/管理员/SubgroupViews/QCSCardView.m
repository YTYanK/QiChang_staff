//
//  QCSCardView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/14.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSCardView.h"


@interface QCSCardView()
@property (strong, nonatomic) UIView * firstBgView;
@property (strong, nonatomic) UIView * mainView;
@end

@implementation QCSCardView


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
    self.backgroundColor = YTYRGBA(242, 242, 242, 1);
    
    self.firstBgView = [[UIView alloc] initWithFrame:CGRectZero];
    self.firstBgView.backgroundColor =  YTYRGBA(62, 146, 198, 1);
    [self addSubview:self.firstBgView];
    
    self.mainView = [[UIView alloc] initWithFrame:CGRectZero];
    self.mainView.backgroundColor = UIColor.whiteColor;
    [self.mainView setViewBorderCornerRadius:6 borderWidth:1 borderColor:UIColor.whiteColor];
    [self addSubview:self.mainView];
    
    if(self.viewBlock != nil){
        self.viewBlock(self.mainView);
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
   [self.firstBgView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self).with.offset(0);
          make.left.equalTo(self);
          make.right.equalTo(self);
          make.height.equalTo(self).with.multipliedBy(0.4);
      }];
      
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.centerX.equalTo(self);
      make.centerY.equalTo(self);
      make.width.equalTo(self).with.multipliedBy(0.92);
      make.height.equalTo(self).with.multipliedBy(0.8);
    }];


}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
