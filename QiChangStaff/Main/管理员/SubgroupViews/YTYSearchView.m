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
        self.searchField.layer.borderWidth = 8;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, self.searchField.frame.size.height)];
        UIImageView * imageView= [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"search"]];
        imageView.frame = CGRectMake(12, -7, 12, 16);
        [leftView addSubview:imageView];
        leftView.backgroundColor = UIColor.clearColor;
        self.searchField.leftView = leftView;
    //    self.searchField.clearButtonMode = UITextFieldViewModeUnlessEditing;
        self.searchField.leftViewMode = UITextFieldViewModeAlways;
        self.searchField.layer.borderColor = YTYRGBA(81, 165, 216, 1).CGColor;
        self.searchField.delegate = self;
        [self addSubview:self.searchField];
}


@end
