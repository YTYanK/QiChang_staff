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
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];

     // 头部
     self.headView = [[AreaHeadView alloc] initWithFrame:CGRectZero];
     [self.view addSubview:self.headView];
    
    // 子标题
    self.staffDetails = [[YTYLabel alloc] initWithFrame:CGRectZero];
    self.staffDetails.backgroundColor = YTYRGBA(55, 141, 202,0.8);
    self.staffDetails.textColor = UIColor.whiteColor;
    self.staffDetails.font = [UIFont systemFontOfSize:15];
    self.staffDetails.textInsets = UIEdgeInsetsMake(15, 18, 15, 0);
    [self.view addSubview:self.staffDetails];
    
    
    //人员信息
    self.staff = [[UILabel alloc] initWithFrame:CGRectZero];
    self.staff.numberOfLines = 2;
    [self.view addSubview:self.staff];
    
    self.number = [[UILabel alloc] initWithFrame:CGRectZero];
    self.number.numberOfLines = 2;
    [self.view addSubview:self.number];
    
    self.date = [[UILabel alloc] initWithFrame:CGRectZero];
    self.date.numberOfLines = 2;
    [self.view addSubview:self.date];
    
    self.address = [[UILabel alloc] initWithFrame:CGRectZero];
    self.address.numberOfLines = 2;
    [self.view addSubview:self.address];
    
    
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
    
    // 人员信息
    [self.staff mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.staffDetails.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(20);
        make.height.mas_equalTo(44);
        make.width.equalTo(self.view).with.multipliedBy(0.3);
    }];
    [self.number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.staffDetails.mas_bottom).with.offset(0);
        make.left.equalTo(self.staff.mas_right).with.offset(0);
        make.height.mas_equalTo(44);
        make.width.equalTo(self.view).with.multipliedBy(0.3);
    }];
    [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.staffDetails.mas_bottom).with.offset(0);
          make.left.equalTo(self.number.mas_right).with.offset(0);
          make.height.mas_equalTo(44);
          make.width.equalTo(self.view).with.multipliedBy(0.3);
      }];
    [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.staff.mas_bottom).with.offset(10);
          make.left.equalTo(self.view).with.offset(20);
          make.height.mas_equalTo(44);
          make.width.equalTo(self.view).with.multipliedBy(0.3);
      }];
    
    
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.address.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
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
        return 1;
    }else {
        return 2;
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
    RecordReceivingCell *cell = [RecordReceivingCell initCellWithCellView:tableView reuseIdentifier:@"RecordReceivingCell"];
    cell.nestingTableView = tableView;
    cell.indexPath = indexPath;
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newCell"];
    
//    cell.frame.origin.y += 15;
//       cell.frame.size.height -= 15;
//       [cell setFrame:frame];
//    if (indexPath.section == 0) {
//
//    }else {
//
//    }
    
    
//    UIImageView * icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"产品"]];
//    [cell addSubview:icon];
//    
//    YTYLabel *title = [[YTYLabel alloc] initWithFrame:CGRectZero];
//    title.backgroundColor = UIColor.redColor;
//    title.font = [UIFont systemFontOfSize:12 weight:UIFontWeightBold];
//    title.textColor = UIColor.blackColor;
//    title.numberOfLines = 5;
//    title.text = @"美國 'Solo' \"BARE\" 四安蒸餾水捲邊 尖杯(Eco-Forward) Packing: 1 x 25 boxes ";
////    title.textInsets = UIEdgeInsetsMake(-10, 0, -10, 0);
////    title.yf_contentInsets = UIEdgeInsetsMake(10, 10, 10, 10);
//    [cell addSubview:title];
//    
//    
//    UIImageView * icon2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"仓库"]];
//    [cell addSubview:icon2];
//    
//    UILabel *area = [[UILabel alloc] initWithFrame:CGRectZero];
//    area.text =[NSString stringWithFormat:@"Area%ld",(long)indexPath.row];
//    area.font = [UIFont systemFontOfSize:12];
//    area.backgroundColor = UIColor.greenColor;
//    [cell addSubview:area];
//    
//    
//    UILabel *type = [[UILabel alloc] initWithFrame:CGRectZero];
//    type.numberOfLines = 2;
//    type.text = [NSString stringWithFormat:@"產品種類\n紙杯"];
////    type.backgroundColor = UIColor.greenColor;
//    [cell addSubview:type];
//     [type setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
//    
//    
//    UILabel *number = [[UILabel alloc] initWithFrame:CGRectZero];
//    number.numberOfLines = 2;
//    number.text = [NSString stringWithFormat:@"產品數量\n10箱"];
////    number.backgroundColor = UIColor.blueColor;
//    [cell addSubview:number];
//     [number setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];
//    
//    CGFloat icon_wh = YTY_DP_375(16);
//    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(cell).with.offset(16);
//        make.left.equalTo(cell).with.offset(20);
//        make.height.mas_equalTo(icon_wh);
//        make.width.mas_equalTo(icon_wh);
//    }];
//    
//    [title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(cell).with.offset(16);
//        make.left.equalTo(icon.mas_right).with.offset(10);
//        make.width.equalTo(cell).with.multipliedBy(0.7);
//    }];
//    
//    [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(cell).with.offset(16);
//        make.left.equalTo(title.mas_right).with.offset(10);
//        make.height.mas_equalTo(icon_wh);
//        make.width.mas_equalTo(icon_wh);
//    }];
//    [area mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(cell).with.offset(16);
//        make.left.equalTo(icon2.mas_right).with.offset(5);
//        make.right.equalTo(cell).with.offset(-5);
//        make.height.mas_equalTo(22);
//    }];
//    [type mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(title.mas_bottom).with.offset(10);
//        make.bottom.equalTo(cell).with.offset(-8);
//        make.left.equalTo(cell).with.offset(20);
//        make.width.equalTo(cell).with.multipliedBy(0.4);
//    }];
//    [number mas_makeConstraints:^(MASConstraintMaker *make) {
//           make.top.equalTo(title.mas_bottom).with.offset(10);
//           make.bottom.equalTo(cell).with.offset(-8);
//           make.left.equalTo(type.mas_right).with.offset(5);
//        make.right.equalTo(cell).with.offset(-20);
////           make.width.equalTo(cell).with.multipliedBy(0.5);
//    }];
    
    
    
//    cell.numLabel.text = @"產品編號\nR77368";
//    cell.nameLabel.text = @"產品名稱\n 32oz DPE White Paper Cup";
//    cell.priceLabel.text = @"$1000 /包";
//    cell.priceLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightBold];
//    cell.icon.image =  [UIImage imageNamed:@"paper"];
//    [cell.numLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12] ];
//     [cell.nameLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12]];
    
   
    
    
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
