//
//  QCSWarehuseRecordDetailsVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/10.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSWarehuseRecordDetailsVC.h"
#import "YTYLabel.h"
#import "AreaHeadView.h"
#import "RecordReceivingCell.h"

@interface QCSWarehuseRecordDetailsVC ()
@property(nonatomic, assign) int index;

@property (strong, nonatomic) AreaHeadView *headView;
@property(strong, nonatomic) YTYLabel *staffDetails;
@property (strong, nonatomic) YTYLabel *details;


@property (strong, nonatomic) UILabel *staff;
@property (strong, nonatomic) UILabel *number;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UILabel *address;

@end

@implementation QCSWarehuseRecordDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"入倉記錄";
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
    
    
    self.isCustomTable = YES;
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.baseTableView];
    
    
    
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
        make.height.mas_equalTo(YTY_DP_375(32));
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
    
    
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(22);
        make.width.equalTo(self.view).with.multipliedBy(1);
    }];
    
}
- (void)updateAllData {
   // 更新头部
    self.headView.dicValue = @{
          @"info": @"當前區域基本資料3",
          @"icon": @"区域",
          @"date": @"最後更新時間\n4/10/19 18:20",
          @"area": @"Area1",
          @"cbm": @"目前可用CBM\n300/300",
          @"name": @"所屬\n倉庫2"
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



#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 11;
    }else {
        return 12;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  YTY_DP_375(32);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    YTYLabel *label = [[YTYLabel alloc] initWithFrame:CGRectZero];
       label.textColor = UIColor.whiteColor;
       label.font = [UIFont systemFontOfSize:15];
       label.textAlignment = NSTextAlignmentCenter;
      
    if (section == 0) {
        label.text = @"已收貨";
        label.backgroundColor = YTYRGBA(0, 146, 63, 1);
    }else {
        label.text = @"待更進";
        label.backgroundColor = YTYRGBA(221, 45, 50, 1);
    }
    return  label;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordReceivingCell *cell = [RecordReceivingCell initCellWithCellView:tableView reuseIdentifier:@"RecordReceivingCell" indexPath:indexPath];
    cell.nestingTableView = tableView;
//    cell.indexPath = indexPath;

      
    
   if(indexPath.section == 0) {
    
    
       
       cell.title.text = @"美國 'Solo' \"BARE\" 四安蒸餾水捲邊 尖杯(Eco-Forward) Packing: 1 x 25 boxes ";
       cell.icon2.image = [UIImage imageNamed:@"仓库"];
       cell.area.textColor = UIColor.blackColor;
       cell.area.text =[NSString stringWithFormat:@"Area%ld",(long)indexPath.row];
       cell.type.text = [NSString stringWithFormat:@"產品種類\n紙杯"];
       [cell.type setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
       cell.number.text = [NSString stringWithFormat:@"產品數量\n10箱"];
       [cell.number setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
       
   }else {
           
       
       
       cell.title.text = @"美國 'Solo' \"BARE\" 四安蒸餾水捲邊 尖杯(Eco-Forward) Packing: 1 x 25 boxes ";
       cell.icon2.image = [UIImage imageNamed:@"error"];
       cell.area.textColor = YTYRGBA(221, 45, 50, 1);
       cell.area.text = [NSString stringWithFormat:@"收不齊"];
       cell.type.text = [NSString stringWithFormat:@"備忘\n有一些產品有問題"];
       [cell.type setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
       cell.number.text = [NSString stringWithFormat:@"產品數量\n10箱"];
   }
    
    return  cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    QCSAreaVC * area = [[QCSAreaVC alloc] init];
//    [self.navigationController  pushViewController:area animated:YES];
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
