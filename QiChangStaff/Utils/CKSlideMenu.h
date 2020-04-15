//
//  CKSlideMenu.h
//  zhengtang_baby
//
//  Created by POP3mac on 2019/9/20.
//  Copyright © 2019 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Normal, //默认
    Gradient, //颜色渐变
    Transfrom  //放大
} SlideMenuTitleStyle;

typedef enum : NSUInteger {
    styleNormal, //常规
    styleFollowText, //跟随文本长度
    styleStretch //伸缩  默认
} SlideMenuIndicatorStyle;


NS_ASSUME_NONNULL_BEGIN


@interface CKSlideMenu : UIView
/// 更新数据方法
typedef void(^CKSlideMenuBlock)(UILabel * menu, UIViewController *vc, int index);

@property (strong, nonatomic) UIColor *selectedColor;
@property (strong, nonatomic) UIColor *unSelectedColor;
@property (assign, nonatomic) SlideMenuIndicatorStyle indicatorStyle;
@property (assign, nonatomic) SlideMenuTitleStyle titleStyle;

@property (assign, nonatomic) CGFloat indicatorWidth;
@property (assign, nonatomic) CGFloat bottomPadding;
@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) UIScrollView *tabScrollView;
@property (strong, nonatomic) UIScrollView *bodyScrollView;
/// 选中的线条
@property (strong, nonatomic) UIView *indicatorView;
@property (strong, nonatomic) UIView *line;
@property (assign, nonatomic) CGFloat indicatorHeight;
/// 是否使用背景颜色， 如果会带下划线 如果 no selectedBgColor, unSelectedBgColor  设置颜色没有效果
@property (assign, nonatomic) BOOL bgColor;
@property (strong, nonatomic) UIColor *selectedBgColor;
@property (strong, nonatomic) UIColor *unSelectedBgColor;
/// 事件block 回调
@property (strong, nonatomic) CKSlideMenuBlock menuBlock;

- (void)updateTitlesAry:(NSArray<NSString *> *)titles;

- (CKSlideMenu *)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles childControllers:(NSArray<UIViewController *> *)vcs;
@end

NS_ASSUME_NONNULL_END
