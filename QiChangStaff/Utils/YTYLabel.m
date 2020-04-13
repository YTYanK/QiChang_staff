//
//  YTYLabel.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "YTYLabel.h"



@implementation YTYLabel
- (instancetype)init {
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

//- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
//    UIEdgeInsets insets = self.textInsets;
//    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, insets)
//                    limitedToNumberOfLines:numberOfLines];
//
//    rect.origin.x    -= insets.left;
//    rect.origin.y    -= insets.top;
//    rect.size.width  += (insets.left + insets.right);
//    rect.size.height += (insets.top + insets.bottom);
//
//    return rect;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
