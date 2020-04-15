//
//  CKSlideMenu.m
//  zhengtang_baby
//
//  Created by POP3mac on 2019/9/20.
//  Copyright © 2019 YTYanK. All rights reserved.
//

#import "CKSlideMenu.h"

@interface CKSlideMenu()<UIScrollViewDelegate>
{
    int leftIndex;
    int rightIndex;
    int selectedIndex;
    //
    CGFloat itemMargin;
    NSArray<NSString *> *titlesAry;
    NSArray<UIViewController *> *controllers;
    //MARK: --
}
@property (assign, nonatomic)CGFloat indicatorAnimatePadding;
@property (strong, nonatomic)NSMutableArray<UILabel *> *itemLabels;

@end

@implementation CKSlideMenu


- (void)setSelectedBgColor:(UIColor *)selectedBgColor {
    if(_selectedBgColor != selectedBgColor) {
        _selectedBgColor = selectedBgColor;
    }
    if(self.bgColor) {
      [self setupBgColorView];
    }
}

- (void)setUnSelectedBgColor:(UIColor *)unSelectedBgColor {
   
    if(_unSelectedBgColor != unSelectedBgColor) {
        _unSelectedBgColor = unSelectedBgColor;
    }
    if(self.bgColor) {
        [self setupBgColorView];
    }
}




- (void)setSelectedColor:(UIColor *)selectedColor {
    if(_selectedColor != selectedColor) {
        _selectedColor = selectedColor;
       
    }
     [self updateColors];
}

- (void)setUnSelectedColor:(UIColor *)unSelectedColor {
    if(_unSelectedColor != unSelectedColor) {
        _unSelectedColor = unSelectedColor;
       
    }
     [self updateColors];
}

- (void)setIndicatorWidth:(CGFloat)indicatorWidth {
    if(_indicatorWidth != indicatorWidth) {
        _indicatorWidth = indicatorWidth;
        if(!_bgColor) {
         [self setupIndicatorView];
        }
    }
}

- (void)setIndicatorHeight:(CGFloat)indicatorHeight {
    if(_indicatorHeight != indicatorHeight) {
        _indicatorHeight = indicatorHeight;
        if(!_bgColor) {
        [self setupIndicatorView];
        }
    }
}

- (void)setBottomPadding:(CGFloat)bottomPadding {
    if(_bottomPadding != bottomPadding) {
        _bottomPadding = bottomPadding;
        if(!_bgColor) {
        [self setupIndicatorView];
        }
    }
}

- (void)setFont:(UIFont *)font {
    if(_font != font) {
        _font = font;
        [self updateFonts];
    }
}



- (CKSlideMenu *)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles childControllers:(NSArray<UIViewController *> *)vcs {
    self = [super initWithFrame:frame];
    if (self) {
        self.tabScrollView = [[UIScrollView alloc] init];
        self.bodyScrollView = [[UIScrollView alloc] init];
        _bottomPadding = 2.f; // 下标距离底部距离
        _indicatorHeight = 2.f; // 下标高度
        _indicatorWidth = 30.f;  // 下标宽度
        _selectedColor =  UIColor.redColor;  // 选中颜色
        _unSelectedColor = UIColor.blackColor; // 未选中颜色
        _selectedBgColor = UIColor.greenColor;  // 选中的背景颜色
        _unSelectedBgColor = UIColor.clearColor; // 未选中的背景颜色
        _indicatorAnimatePadding = 8.f; //伸缩动画的偏移量
        _font = [UIFont systemFontOfSize:14.f]; // 标题字体
        _line = [[UIView alloc] init];
        _indicatorView = [[UIView alloc] init];   //下划线
        _indicatorStyle = styleStretch;
        _titleStyle = Normal;
        titlesAry = titles;
        controllers = vcs;
        itemMargin = 15.0;
        leftIndex = 0;
        rightIndex = 0;
        selectedIndex = 0;
        _itemLabels = [NSMutableArray array];
        
        [self setupTabScrollView];
        if(!_bgColor) {
           [self setupIndicatorView];
        }else {
            [self setupBgColorView];
        }
        _line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [self addSubview:_line];
        
    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _tabScrollView.frame = self.bounds;
    _line.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
    for(UILabel * item in _itemLabels) {
        CGRect frame = item.frame;
        frame.size.height = self.frame.size.height;
        item.frame = frame;
    }
    
    if(self.bodyScrollView.superview == nil) {
        [self.superview addSubview:_bodyScrollView];
        [self setupBodyScrollView];
    }
    
}


- (void)setupBodyScrollView {
    _bodyScrollView.showsVerticalScrollIndicator = false;
    _bodyScrollView.showsHorizontalScrollIndicator = false;
    _bodyScrollView.pagingEnabled = true;
    _bodyScrollView.bounces = false;
    _bodyScrollView.delegate = self;
    CGRect frame = self.superview.frame;
    CGFloat maxY = self.frame.size.height + self.frame.origin.y;
    // 这里加高了10
//    _bodyScrollView.frame = CGRectMake(0, maxY +10, frame.size.width, frame.size.height - maxY);
    _bodyScrollView.frame = CGRectMake(0, maxY + 5, frame.size.width, frame.size.height - maxY);
    for(int i = 0; i < controllers.count; i++) {  //(int i = 0; i < controllers.count; i++)
        //UIViewController *vc = controllers[i];
        controllers[i].view.frame = _bodyScrollView.bounds;
        controllers[i].view.center = CGPointMake(_bodyScrollView.frame.size.width * (i + 0.5), _bodyScrollView.frame.size.height/2);
        [_bodyScrollView addSubview:controllers[i].view];
    }
    _bodyScrollView.contentSize = CGSizeMake(_bodyScrollView.frame.size.width * controllers.count, _bodyScrollView.frame.size.height);
    
}

// 更新标题？
- (void)updateTitlesAry:(NSArray<NSString *> *)titles {
    titlesAry = titles;
    [self setupTabScrollView];
    if(!_bgColor) {
        [self setupIndicatorView];
    }else {
        [self setupBgColorView];
    }
}

// 配置导航栏
- (void)setupTabScrollView {
    _tabScrollView.frame = self.bounds;
    _tabScrollView.showsVerticalScrollIndicator = false;
    _tabScrollView.showsHorizontalScrollIndicator =  false;
    _tabScrollView.backgroundColor = UIColor.clearColor;
    [self addSubview:_tabScrollView];
    
    CGFloat originX = itemMargin;
    for (int k = 0; k < titlesAry.count; k++) {
        NSString *title = titlesAry[k];
        UILabel *item = [[UILabel alloc] init];
        item.userInteractionEnabled = YES;
        
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: _font}]; //[title sizeWithAttributes:@{NSFontAttributeName : self.font}];
       // 增加背景颜色
        item.frame = CGRectMake(originX, 0, size.width + 20, self.frame.size.height);
        item.textAlignment = NSTextAlignmentCenter;
        // 设置属性
        item.text = title;
        item.font = _font;
        item.textColor = ((k == selectedIndex)? _selectedColor : _unSelectedColor);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClicked:)];
        //tap
        [item addGestureRecognizer:tap];
        [_itemLabels addObject:item];
        [_tabScrollView addSubview:item];
        
        originX = (item.frame.size.width + item.frame.origin.x) + (2 * itemMargin);
    }
    _tabScrollView.contentSize = CGSizeMake(originX - itemMargin, self.frame.size.height);
    [_tabScrollView addSubview:_indicatorView];
    
    if(_tabScrollView.contentSize.width < self.frame.size.width) {
        // item //item长度小于width，重新计算margin排版
        [self updateLabelsFrame];
    }
}
// 更新_itemLabels的布局
- (void)updateLabelsFrame {
    CGFloat newMarigin = itemMargin + (self.frame.size.width - _tabScrollView.contentSize.width)/(_itemLabels.count *2);
    CGFloat originX = newMarigin;
   
    for (UILabel *item in _itemLabels) {
        CGRect frame = item.frame;
        frame.size.height = self.frame.size.height;
        frame.origin.x = originX;
        item.frame = frame;
        CGFloat maxX = frame.size.width + frame.origin.x;
        originX = maxX + (2*newMarigin);
    }
    _tabScrollView.contentSize = CGSizeMake(originX - newMarigin, self.frame.size.height);
}

//配置下标
- (void)setupIndicatorView {
    CGRect frame = _itemLabels[selectedIndex].frame;
    frame.origin.y = self.frame.size.height - _bottomPadding - _indicatorHeight;
    frame.size.height = _indicatorHeight;
    
    if(_indicatorStyle == styleNormal) {
        CGFloat midX = frame.size.width  + frame.origin.x;
        frame.origin.x = midX - _indicatorWidth/2;
        frame.size.width = _indicatorWidth;
    }
    _indicatorView.frame = frame;
    _indicatorView.backgroundColor  = _selectedColor;
}

- (void)setBgColor:(BOOL)bgColor {
    if(_bgColor != bgColor) {
        _bgColor = bgColor;
        if(_bgColor == YES) {
          _indicatorView.hidden = _bgColor;
          [self setupBgColorView];
        }
    }
    
}


// 配置背景颜色
- (void)setupBgColorView {
    int k = 0;
    for (UILabel *item in _itemLabels) {
        
        item.textColor = ((k == selectedIndex)? _selectedColor : _unSelectedColor);
        item.backgroundColor = ((k == selectedIndex)? _selectedBgColor : _unSelectedBgColor);
        //[item dcViewSetCornerRadius:item.height/2 borderWidth:0 borderColor:UIColor.clearColor];
        [item setViewBorderCornerRadius:item.height/2 borderWidth:0 borderColor:UIColor.clearColor];
        k++;
    }

    
}

// 更新字体
- (void)updateFonts {
    CGFloat originX = itemMargin;
    for (UILabel *item in _itemLabels) {
        //计算title长度
        CGSize size = [item.text sizeWithAttributes:@{NSFontAttributeName: _font}];
        item.frame = CGRectMake(originX, 0, size.width, self.frame.size.height);
        //设置属性
        item.font = _font;
        CGFloat maxX = item.frame.size.width  + item.frame.origin.x;
        originX = maxX + 2* itemMargin;
    }
    _tabScrollView.contentSize = CGSizeMake(originX - itemMargin, self.frame.size.height);
    if(_tabScrollView.contentSize.width < self.frame.size.width) {
        //item长度小于width，重新计算margin排版
        [self updateLabelsFrame];
    }
    if(!_bgColor) {
     [self setupIndicatorView];
    }
}

// 更新字体颜色
- (void)updateColors {
    for(UILabel *item in _itemLabels) {
        item.textColor = _unSelectedColor;
    }
    _itemLabels[selectedIndex].textColor = _selectedColor;
    _indicatorView.backgroundColor = _selectedColor;
}
// 修正tabScrollView的位置
- (void)resetTabScrollViewFrame {
    UILabel *seletedItem = _itemLabels[selectedIndex];
    CGFloat tab_width  = _tabScrollView.frame.size.width;
    CGFloat reviseX = 0;
    if((seletedItem.center.x + (tab_width/2)) >= _tabScrollView.contentSize.width) {
        reviseX = _tabScrollView.contentSize.width - tab_width;
    }else if (seletedItem.center.x - tab_width/2 <= 0) {
        reviseX = 0;
    }else {
        reviseX = seletedItem.center.x - tab_width/2;
    }
    [_tabScrollView setContentOffset:CGPointMake(reviseX, 0) animated:true];
    //可以加代理
}


//渐变颜色
- (UIColor *)averageColor:(UIColor *)fromColor toColor:(UIColor *)toColor percenr:(CGFloat)percent {
    CGFloat fromRed = 0.0;
    CGFloat fromGreen = 0.0;
    CGFloat fromBlue = 0.0;
    CGFloat fromAlpha  = 0.0;
    [fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    
    CGFloat toRed = 0.0;
    CGFloat toGreen = 0.0;
    CGFloat toBlue = 0.0;
    CGFloat toAlpha = 0.0;
    [toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    
    CGFloat nowRed = fromRed + (toRed - fromRed)*percent;
    CGFloat nowGreen = fromGreen + (toGreen - fromGreen)*percent;
    CGFloat nowBlue = fromBlue + (toBlue - fromBlue)*percent;
    CGFloat nowAlpha = fromAlpha + (toAlpha - fromAlpha)*percent;

    return [UIColor colorWithRed:nowRed green:nowGreen blue:nowBlue alpha:nowAlpha];
}


// 导航栏点击事件
- (void)itemClicked:(UITapGestureRecognizer *)tap {
    UILabel *item = (UILabel *)tap.view;
    if(item == _itemLabels[selectedIndex]) {
        return;
    }
    
    int fromIndex = selectedIndex;
    selectedIndex = (int)[_itemLabels indexOfObject:item];
    [self changeTitleItemFrom:fromIndex to:selectedIndex];
    [self changeIndicatorFrom:fromIndex to:selectedIndex];
    [_bodyScrollView setContentOffset:CGPointMake(_bodyScrollView.frame.size.width * selectedIndex, 0) animated:false];
    [self resetTabScrollViewFrame];
    
    //可以加代理事件
    if(self.menuBlock != nil) {
        self.menuBlock(item, controllers[selectedIndex], selectedIndex);
    }
}


//点击事件触发的UI更新
- (void)changeTitleItemFrom:(int)from to:(int)to {
    
    
    if(_bgColor) {
        _itemLabels[from].textColor = self.unSelectedColor;
        _itemLabels[to].textColor = UIColor.whiteColor;
    //背景颜色
      _itemLabels[from].backgroundColor = self.unSelectedBgColor;
      _itemLabels[to].backgroundColor = self.selectedBgColor;
    }else {
        _itemLabels[from].textColor = self.unSelectedColor;
        _itemLabels[to].textColor = self.selectedColor;
    }
    
    if(self.titleStyle == Transfrom) {
        [UIView animateWithDuration:0.25 animations:^{
            self.itemLabels[to].transform = CGAffineTransformMakeScale(1.05, 1.05);
            self.itemLabels[from].transform = CGAffineTransformIdentity;
        }];
    }
}
 //点击事件触发的UI更新
- (void)changeIndicatorFrom:(int)from to:(int)to {
    UILabel *fromItem = _itemLabels[from];
    UILabel *toItem = _itemLabels[to];
    if(self.indicatorStyle != styleStretch) {
        [UIView animateWithDuration:0.3 animations:^{
            self.indicatorView.center = CGPointMake(toItem.center.x, self.indicatorView.center.y);
        }];
        
    }else {
        CGRect frame = self.indicatorView.frame;
        frame.size.width = _itemLabels[to].frame.size.width;
        CGRect finnalFrame = frame;
        CGFloat max = fromItem.frame.size.width + toItem.frame.size.width + (2*itemMargin);
        frame.size.width = max - _indicatorAnimatePadding * 2;
        
        CGFloat toMaxX = toItem.frame.size.width + toItem.frame.origin.x;
        CGFloat fromMinX = fromItem.frame.origin.x;
        
        CGFloat x = (toMaxX - fromMinX)/2 + fromMinX;
        [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
            
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.15 animations:^{
                self.indicatorView.frame = frame;
                self.indicatorView.center = CGPointMake(x, self.indicatorView.center.y);
            }];
            
            [UIView addKeyframeWithRelativeStartTime:0.15 relativeDuration:0.15 animations:^{
                self.indicatorView.frame = finnalFrame;
                self.indicatorView.center = CGPointMake(toItem.center.x, self.indicatorView.center.y);
            }];
            
            
        } completion:nil];
        
    
    }
}


// MARK: - 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(scrollView == self.bodyScrollView) {
        CGPoint offset =  scrollView.contentOffset;
        if(offset.x <= 0) {
            // 左边界
            leftIndex = 0;
            rightIndex = leftIndex;
        }else if(offset.x >= scrollView.contentSize.width - scrollView.frame.size.width){
            //右边界
            leftIndex = (int)(_itemLabels.count - 1);
            rightIndex = leftIndex;
        }else {
            leftIndex = (offset.x/scrollView.frame.size.width);
            rightIndex = leftIndex + 1;
        }
        
        //计算偏移的相对位移
        CGFloat relativeLacation = _bodyScrollView.contentOffset.x/_bodyScrollView.frame.size.width - leftIndex;
        if(relativeLacation == 0){
            return;
        }
        //更新UI
        [self updateIndicatorStyle:relativeLacation];
        [self updateTitleStyle:relativeLacation];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.bodyScrollView) {
        selectedIndex = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
        [self resetTabScrollViewFrame];
        
        if(self.menuBlock != nil) {
            self.menuBlock(_itemLabels[selectedIndex], controllers[selectedIndex], selectedIndex);
        }
    }
}



- (void)updateIndicatorStyle:(CGFloat)relativeLacation {
    
    UILabel *leftItem = _itemLabels[leftIndex];
    UILabel *rightItem = _itemLabels[rightIndex];
    
    if(self.indicatorStyle == Normal) {
        //常规模式 只需更新中心点即可
        CGFloat max = rightItem.center.x - leftItem.center.x;
        self.indicatorView.center = CGPointMake(leftItem.center.x + max*relativeLacation, self.indicatorView.center.y);
    }
    else {
        //仔细观察位移效果，分析出如下计算公式
        CGFloat distance = (self.indicatorStyle == styleFollowText ? 0 : self.indicatorAnimatePadding);
        CGRect frame = self.indicatorView.frame;
        CGFloat maxX = rightItem.frame.size.width + rightItem.frame.origin.x;
        CGFloat minX = leftItem.frame.origin.x;
        
        CGFloat maxWidth = maxX - minX - distance*2;
        if(relativeLacation <= 0.5 ){
            frame.size.width = leftItem.frame.size.width + (maxWidth - leftItem.frame.size.width)*(relativeLacation/0.5);
            frame.origin.x = minX + distance*(relativeLacation/0.5);
        }
        else{
            frame.size.width = rightItem.frame.size.width + (maxWidth - rightItem.frame.size.width)*((1-relativeLacation)/0.5);
            frame.origin.x = maxX - frame.size.width - distance*((1-relativeLacation)/0.5);
        }
        self.indicatorView.frame = frame;
    }
}

// 更新标题样式
- (void)updateTitleStyle:(CGFloat)relativeLacation {
    UILabel *leftItem = _itemLabels[leftIndex];
    UILabel *rightItem = _itemLabels[rightIndex];
    switch(self.titleStyle) {
    case Gradient:
            if(_bgColor) {
                leftItem.textColor = [self averageColor:UIColor.whiteColor toColor:self.unSelectedColor percenr:relativeLacation];
                rightItem.textColor = [self averageColor:self.unSelectedColor toColor:UIColor.whiteColor percenr:relativeLacation];
            leftItem.backgroundColor = [self averageColor:self.selectedBgColor toColor:self.unSelectedBgColor percenr:relativeLacation];
            rightItem.backgroundColor = [self averageColor:self.unSelectedBgColor toColor:self.selectedBgColor percenr:relativeLacation];
            }else {
                leftItem.textColor = [self averageColor:self.selectedColor toColor:self.unSelectedColor percenr:relativeLacation];
                rightItem.textColor = [self averageColor:self.unSelectedColor toColor:self.selectedColor percenr:relativeLacation];
            }
    case Normal:
            leftItem.textColor = (relativeLacation <= 0.5 ? self.selectedColor : self.unSelectedColor);
            rightItem.textColor = (relativeLacation <= 0.5 ? self.unSelectedColor : self.selectedColor);
        
    default:
        
        if (relativeLacation <= 0.5) {
            if(_bgColor) {
                leftItem.textColor = UIColor.whiteColor;
                leftItem.backgroundColor = _selectedBgColor;
                leftItem.transform = CGAffineTransformMakeScale(1.05, 1.05);
                
                rightItem.textColor = _unSelectedColor;
                rightItem.backgroundColor = _unSelectedBgColor;
                rightItem.transform = CGAffineTransformIdentity;
            }else {
                leftItem.textColor = _selectedColor;
                leftItem.transform = CGAffineTransformMakeScale(1.05, 1.05);
                
                rightItem.textColor = _unSelectedColor;
                rightItem.transform = CGAffineTransformIdentity;
            }
            
        }
        else {
            if(_bgColor) {
                leftItem.textColor = _unSelectedColor;
                leftItem.backgroundColor = _unSelectedBgColor;
                leftItem.transform = CGAffineTransformIdentity;
                
                rightItem.textColor = UIColor.whiteColor;
                rightItem.backgroundColor = _selectedBgColor;
                rightItem.transform = CGAffineTransformMakeScale(1.05, 1.05);
            
            }else {
                leftItem.textColor = _unSelectedColor;
                leftItem.transform =  CGAffineTransformIdentity;  //CGAffineTransform.identity
                
                rightItem.textColor = _selectedColor;
                rightItem.transform = CGAffineTransformMakeScale(1.05, 1.05);
            }
            
            
       
        }
            break;
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
