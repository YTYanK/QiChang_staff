//
//  QCSProcessingOrderVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSProcessingOrderVC.h"
#import "AreaHeadView.h"
#import "YTYLabel.h"

@interface QCSProcessingOrderVC ()
@property (strong, nonatomic) AreaHeadView *headView;
@property(strong, nonatomic) YTYLabel *staffDetails;

@property (strong, nonatomic) UILabel *staff;
@property (strong, nonatomic) UILabel *number;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UILabel *address;
@end

@implementation QCSProcessingOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setAllInitSubView];
    [self updateAllData];
    
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"處理貨單";
    self.view.backgroundColor = NAV_COLOR;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];

     // 头部
     self.headView = [[AreaHeadView alloc] initWithFrame:CGRectZero];
     [self.view addSubview:self.headView];
    
    // 子标题
    self.staffDetails = [[YTYLabel alloc] initWithFrame:CGRectZero];
    self.staffDetails.backgroundColor = NAV_COLOR;
    self.staffDetails.textColor = UIColor.whiteColor;
    self.staffDetails.font = [UIFont systemFontOfSize:15];
    self.staffDetails.textInsets = UIEdgeInsetsMake(15, 18, 15, 0);
    [self.view addSubview:self.staffDetails];
    
    
    
    
    //人员信息
    UIView *bg = [[UIView alloc] initWithFrame:CGRectZero];
    bg.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:bg];

    self.staff = [[UILabel alloc] initWithFrame:CGRectZero];
    self.staff.numberOfLines = 2;
    [bg addSubview:self.staff];

    self.number = [[UILabel alloc] initWithFrame:CGRectZero];
    self.number.numberOfLines = 2;
    [bg addSubview:self.number];

    self.date = [[UILabel alloc] initWithFrame:CGRectZero];
    self.date.numberOfLines = 2;
    [bg addSubview:self.date];

    self.address = [[UILabel alloc] initWithFrame:CGRectZero];
    self.address.numberOfLines = 2;
    [bg addSubview:self.address];
    
    
//    self.isCustomTable = YES;
//    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
//    // 需要创建对象之后使用
//    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
//    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self.view addSubview:self.baseTableView];
    
    
    
    // layoutSubviews
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(SCREEN_NAV_BAR);
        make.height.mas_equalTo(140);
        make.width.equalTo(self.view.mas_width);
    }];
    
    [self.staffDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.headView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(YTY_DP_375(40));
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.staffDetails.mas_bottom).with.offset(0);
         make.left.equalTo(self.view).with.offset(0);
         make.width.equalTo(self.view).with.multipliedBy(1);
         make.height.equalTo(self.view).with.multipliedBy(0.18);
    }];
    
    // 人员信息
    [self.staff mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg).with.offset(20);
        make.left.equalTo(bg).with.offset(20);
        make.height.mas_equalTo(44);
        make.width.equalTo(bg).with.multipliedBy(0.3);
    }];
    [self.number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg).with.offset(20);
        make.left.equalTo(self.staff.mas_right).with.offset(0);
        make.height.mas_equalTo(44);
        make.width.equalTo(bg).with.multipliedBy(0.3);
    }];
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(bg).with.offset(20);
          make.left.equalTo(self.number.mas_right).with.offset(0);
          make.height.mas_equalTo(44);
          make.width.equalTo(bg).with.multipliedBy(0.3);
      }];
    [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.staff.mas_bottom).with.offset(10);
          make.left.equalTo(bg).with.offset(20);
          make.height.mas_equalTo(44);
          make.width.equalTo(bg).with.multipliedBy(0.3);
      }];
    
    
//    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(bg.mas_bottom).with.offset(0);
//        make.left.equalTo(self.view).with.offset(0);
//        make.bottom.equalTo(self.view).with.offset(22);
//        make.width.equalTo(self.view).with.multipliedBy(1);
//    }];
    
}
- (void)updateAllData {
   // 更新头部
    self.headView.dicValue = @{
          @"info": @"來貨單資料",
          @"icon": @"编号",
          @"date": @"最後更新時間\n4/10/19 18:20",
          @"area": @"219384719",
          @"cbm": @"目前可用CBM\n300/300",
          @"name": @"供應商\nHKABC",
          @"twoPlace": @(YES)
      };
    self.staffDetails.text = @"入倉詳情";

    self.staff.text = @"入倉員工\n林主管";
    self.number.text =@"入倉員工編號\n21398184";
    self.date.text = @"最後更新時間\n1/10/2019 16:40";
    self.address.text = @"入倉地址\n九龍";
    
    
    [self.staff setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12 weight:UIFontWeightBold] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:UIColor.blackColor];
    [self.number setRangeOfString:@"\n" lineSpacing:2 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:[UIColor blackColor]];
    [self.date setRangeOfString:@"\n" lineSpacing:2 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:[UIColor blackColor]];
    [self.address setRangeOfString:@"\n" lineSpacing:2 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:15] tailColor:[UIColor blackColor]];
    
    
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

@end
