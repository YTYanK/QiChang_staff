//
//  QCSWarehousingVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/26.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSWarehousingVC.h"
#import "QCSCardView.h"
#import "QCSProcessingOrderVC.h"

@interface QCSWarehousingVC ()
@property (strong, nonatomic) QCSCardView *cardView;
@property (strong, nonatomic) UITextField *searchField;

@property (strong, nonatomic) UILabel *dateTile;
@property (strong, nonatomic) UIButton *listsTitle;


@end

@implementation QCSWarehousingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAllInitSubView];
    [self updateAllData];
}

#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"扫描入仓";
    self.view.backgroundColor =  NAV_COLOR;
    
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake(20, SCREEN_NAV_BAR, SCREEN_WIDTH - 40, 40)];
    self.searchField.placeholder = @"掃描 Bar code/輸入";
    [self.searchField borderForColor:UIColor.whiteColor borderWidth:1 borderType:YTYBorderSideTypeBottom];
    
    UIButton  *scan = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 60, 25)];
    [scan setTitle:@"按下掃描" forState:UIControlStateNormal];
    [scan setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    scan.titleLabel.font = [UIFont systemFontOfSize:13  weight:UIFontWeightBold];
    [scan addTarget:self action:@selector(scanClick:) forControlEvents:UIControlEventTouchUpInside];
    UIView  *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 25)];
    [v setViewBorderCornerRadius:0 borderWidth:1 borderColor:UIColor.whiteColor];
    [v addSubview:scan];

    
    self.searchField.rightViewMode  = UITextFieldViewModeAlways;
    self.searchField.rightView = v;
    [ self.view addSubview: self.searchField];

    // 标题
    self.dateTile = [[UILabel alloc] initWithFrame:CGRectMake(20, self.searchField.maxY + 10, SCREEN_WIDTH - 40, 30)];
    self.dateTile.text = @"採購單資料";
    self.dateTile.textColor = UIColor.whiteColor;
    [self.view addSubview:self.dateTile];
    
    
    NSArray * textAry = @[@"採購單編號:",@"採購日期:",@"供應商:"];
    self.cardView = [[QCSCardView alloc] initWithFrame:CGRectMake(0, self.dateTile.maxY, SCREEN_WIDTH, 150)];
    self.cardView.viewBlock = ^(UIView * _Nonnull view) {

        for (int i = 0; i < textAry.count; i++) {

            CGFloat y = (i * 30) + (i * 6) + 10;
            UILabel * text = [[UILabel alloc] initWithFrame:CGRectZero];
            text.font = [UIFont systemFontOfSize:14];
            text.text = [NSString stringWithFormat:@"%@",textAry[i]];
            [view addSubview:text];

            [text mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view).with.offset(y);
                make.left.equalTo(view).with.offset(20);
                make.height.mas_equalTo(30);
                make.width.equalTo(view).with.multipliedBy(0.8);
            }];

        }
    };
    [self.view addSubview:self.cardView];
    
    
    self.listsTitle = [[UIButton alloc] initWithFrame:CGRectMake(0, self.cardView.maxY, SCREEN_WIDTH, 40)];
    [self.listsTitle setTitle:@"產品列表" forState:UIControlStateNormal];
    self.listsTitle.backgroundColor = YTYRGBA(242, 242, 242, 1);
    [self.listsTitle setTitleColor:NAV_COLOR forState:UIControlStateNormal];
    UIImage * image = [[UIImage imageNamed:@"产品"] scaleImageWithSize:CGSizeMake(20, 20)];
    [self.listsTitle setImage:image forState:(UIControlStateNormal)];
    [self.listsTitle setImageEdgeInsets:UIEdgeInsetsMake(-10, 20, 0, 40)];
    [self.listsTitle setTitleEdgeInsets:UIEdgeInsetsMake(-10, 30, 0, 30)];
    self.listsTitle.enabled = NO;
    self.listsTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:self.listsTitle];
    
    
    self.isCustomTable = YES;
  
    if (IS_IPHONE_X) {
//      self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.listsTitle.maxY, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 26)];
    }else {
      self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.listsTitle.maxY, SCREEN_WIDTH, SCREEN_HEIGHT - self.listsTitle.maxY - 40)];
    }

    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [self.view addSubview:self.baseTableView];
    
    
//    __weak __typeof(self)weakSelf = self;
    CGFloat leftW =  SCREEN_WIDTH * 0.2;
    CGFloat avew =   (SCREEN_WIDTH * 0.6);
    self.additionalBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        
            UIView *subView = [[UIView alloc] initWithFrame:CGRectZero];
            subView.backgroundColor = UIColor.whiteColor;
              
            UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
            line.backgroundColor = YTYRGBA(220, 220, 220, 1);
            
              UILabel *l0 = [[UILabel alloc] initWithFrame:CGRectZero];
              l0.textAlignment = NSTextAlignmentCenter;
              l0.textColor = UIColor.blackColor;
              l0.font = [UIFont systemFontOfSize:13];
            
              UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
              l1.textAlignment = NSTextAlignmentCenter;
              l1.textColor = UIColor.blackColor;
              l1.font = [UIFont systemFontOfSize:13];
              l1.numberOfLines = 4;
              UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
              l2.textAlignment = NSTextAlignmentCenter;
              l2.textColor = UIColor.blackColor;
              l2.font = [UIFont systemFontOfSize:13 ];
              
              UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectZero];
            
              [subView addSubview:l0];
              [subView addSubview:l1];
              [subView addSubview:l2];
              [subView addSubview:icon];
              [subView addSubview:line];
             
               
              l0.text = [NSString stringWithFormat:@"%d",indexPath.row];
              l1.text = @"美國 'Solo' \"BARE\" 四安蒸餾水 捲邊尖杯(Eco-Forward)Packing:  1 x 25boxes x";
              l2.text = @"10件";
              
            
              [l0 mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.top.equalTo(subView).with.offset(0);
                  make.left.equalTo(subView).with.offset(0);
                  make.height.equalTo(subView.mas_height);
                  make.width.mas_equalTo(leftW);
              }];
            
              [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
                  make.top.equalTo(subView).with.offset(0);
                  make.left.equalTo(l0.mas_right).with.offset(0);
                  make.height.equalTo(subView.mas_height);
                  make.width.mas_equalTo(avew);
              }];
              [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(subView).with.offset(0);
                 make.left.equalTo(l1.mas_right).with.offset(0);
                 make.height.equalTo(subView.mas_height);
                 make.width.mas_equalTo(leftW);
              }];
        
             
             [line mas_makeConstraints:^(MASConstraintMaker *make) {

                make.left.equalTo(subView).with.offset(0);
                make.bottom.equalTo(subView).with.offset(1);
                make.height.mas_equalTo(1);
                make.width.equalTo(subView).with.multipliedBy(1);
             }];
            
            [cell addSubview:subView];
            
            [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell).with.offset(0);
                make.left.equalTo(cell).with.offset(0);
                make.height.equalTo(cell);
                make.width.equalTo(cell);
            }];
            
        };
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.baseTableView.maxY, SCREEN_WIDTH, 40)];
    [btn setTitle:@"處理貨單" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(processingClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
- (void)updateAllData {
   // 更新头部
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
    UIView *subV = [[UIView alloc] init];
    subV.backgroundColor = NAV_COLOR;
    
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectZero];
    l1.textAlignment = NSTextAlignmentCenter;
    l1.textColor = UIColor.whiteColor;
    l1.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectZero];
    l2.textAlignment = NSTextAlignmentCenter;
    l2.textColor = UIColor.whiteColor;
    l2.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectZero];
    l3.textAlignment = NSTextAlignmentCenter;
    l3.textColor = UIColor.whiteColor;
    l3.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    [subV addSubview:l1];
    [subV addSubview:l2];
    [subV addSubview:l3];
    
    l1.text = @"";
    l2.text = @"產品名稱";
    l3.text = @"數量";
   
    CGFloat leftW =  SCREEN_WIDTH * 0.2;
    CGFloat avew =   (SCREEN_WIDTH * 0.6);
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subV).with.offset(0);
        make.left.equalTo(subV).with.offset(0);
        make.height.equalTo(subV.mas_height);
        make.width.mas_equalTo(leftW);
    }];
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l1.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.mas_equalTo(avew);
    }];
    [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l2.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.mas_equalTo(leftW);
    }];
    
    return  subV;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    DeliveryReportCell *cell = [DeliveryReportCell initCellWithCellView:tableView reuseIdentifier:@"DeliveryReportCell"];
//    cell.nestingTableView = tableView;
//
//    cell.icon.image = [UIImage imageNamed:@"logo"];
//    cell.icon.backgroundColor = UIColor.redColor;
//    cell.number.text = @"員工編號 382846583";
//    cell.name.text = @"名稱\n陳大文";
//    [cell.name setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
//
//    return  cell;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    QCSWarehuseRecordDetailsVC * details = [[QCSWarehuseRecordDetailsVC alloc] init];
//    [self.navigationController  pushViewController:details animated:YES];
 }


#pragma mark - 加载刷新
// 刷新
- (void)tableRefreshData {
    [self tableRefreshDataWithPage:1];
}
- (void)tableLoadData {
    [self tableLoadDataWithPage:1];
}

// 刷新
- (void)tableRefreshDataWithPage:(int)page {
//    NSMutableDictionary * dic =[NSMutableDictionary dictionary];
//    [dic setObject:isLogin forKey:@"session_token"];

    [self.baseTableView.mj_header endRefreshing];
    [self.baseTableView reloadData];
}

// 加载
- (void)tableLoadDataWithPage:(int)page {
    [self.baseTableView.mj_footer endRefreshing];
}


- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)scanClick:(UIButton *)sender {
    NSLog(@"点击");
}

- (void)processingClick:(UIButton *)sender {
    NSLog(@"----处理");
    QCSProcessingOrderVC * order = [[QCSProcessingOrderVC alloc] init];
    [self.navigationController pushViewController:order animated:YES];
}
@end
