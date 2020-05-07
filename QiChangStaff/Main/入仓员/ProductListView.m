//
//  ProductListView.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "ProductListView.h"
#import "ProductCollectCell.h"


@interface ProductListView()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;

@property (strong, nonatomic) NSArray * titles;
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
   
    UIImageView * icon = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:icon];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 400.0; //预估高度
    [self addSubview:self.tableView];
    if (@available(iOS 11.0, *)) {
           // https://www.jianshu.com/p/b616bea9da88
           self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
       }
    
     self.titles = @[@"美國 'Solo' \"BARE\" 四安蒸餾水捲邊尖杯(Eco- Forward) Packing: 1 x 25boxes x",@"美fffffffff國 'Solo' \"BARE\" 四安蒸餾水捲邊尖杯(Eco- Forward) Packing: 1 x 25boxes x",@"美國 'Solo'eeeeeeeeeeeeeeeeeeeeeefwqafwefewfefawefe \"BARE\" 四安蒸餾水捲邊尖杯(Eco- Forward) Packing: 1 x 25boxes x",];
    
      [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.top.equalTo(self).with.offset(0);
//         make.left.equalTo(self).with.offset(0);
//          make.bottom.equalTo(self).with.offset(0);
////         make.height.mas_equalTo(40 * 3);
//         make.width.equalTo(self);
          make.edges.equalTo(self);
     }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}// numberOfRowsInSection:(NSInteger)section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.titles.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   UIView *subV = [[UIView alloc] init];
       subV.backgroundColor = NAV_COLOR;
       
       UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
       l1.textAlignment = NSTextAlignmentCenter;
       l1.textColor = UIColor.whiteColor;
       l1.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
//       UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
//       l2.textAlignment = NSTextAlignmentCenter;
//       l2.textColor = UIColor.whiteColor;
//       l2.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
//       UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectZero];
//       l3.textAlignment = NSTextAlignmentCenter;
//       l3.textColor = UIColor.whiteColor;
//       l3.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
       [subV addSubview:l1];
//       [subV addSubview:l2];
//       [subV addSubview:l3];
       
       l1.text = @"產品列表";
//       l2.text = @"數量";
//       l3.text = @"實際數量";
      
       CGFloat leftW =  SCREEN_WIDTH * 0.3;
       CGFloat avew =   SCREEN_WIDTH - (SCREEN_WIDTH * 0.6);
       [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(subV).with.offset(0);
           make.left.equalTo(subV).with.offset(0);
           make.height.equalTo(subV.mas_height);
           make.width.mas_equalTo(leftW);
       }];
//       [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
//          make.top.equalTo(subV).with.offset(0);
//          make.left.equalTo(l1.mas_right).with.offset(0);
//          make.height.equalTo(subV.mas_height);
//          make.width.mas_equalTo(leftW);
//       }];
//       [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
//          make.top.equalTo(subV).with.offset(0);
//          make.left.equalTo(l2.mas_right).with.offset(0);
//          make.height.equalTo(subV.mas_height);
//          make.width.mas_equalTo(avew);
//       }];
       
       return  subV;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //ProductCell *cell = [ProductCell initCellWithCellView:tableView reuseIdentifier:@"ProductCell"];
    ProductCollectCell *cell = [ProductCollectCell initCellWithCellView:tableView reuseIdentifier:@"ProductCollectCell"];

    cell.titleLabel.text = self.titles[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
