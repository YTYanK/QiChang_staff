//
//  ProductListView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductListView.h"

@interface ProductListView()


@end


@implementation ProductListView


- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"???--%s",__func__);
    // 固定设置高度
    self = [super initWithFrame:frame];
    if (self) {
        [self initAllView];
    }
    return self;
}


- (void)initAllView {
   
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
