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
    frame = CGRectMake(0, 0, SCREEN_WIDTH, 140);
    self = [super initWithFrame:frame];
    if (self) {
        [self initAllView];
    }
    return self;
}

- (void)initAllView {
    self.icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self addSubview:self.icon];
    
    self.area = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.area];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.name];
    
    
    self.cbm = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.cbm];
    
    
    self.date = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.date];
    
    
    [self updateAllData];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)updateAllData {
    self.date.text = @"最後更新時間\n 4/10/19 18:20";
    self.area.text = @"Area1";
    self.cbm.text = @"目前可用CBM\n 100/300";
    self.name.text = @"所屬\n倉庫1";
}



@end
