//
//  QCSWarehouseRecordVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/8.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSWarehouseRecordVC.h"
#import "YTYSearchView.h"


@interface QCSWarehouseRecordVC ()

@property(nonatomic, assign) int index;
@property (nonatomic, strong) YTYSearchView * searchView;

@end

@implementation QCSWarehouseRecordVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"入倉單";
    self.view.backgroundColor = YTYRGBA(242, 242, 242, 1);
    
    
    self.searchView = [[YTYSearchView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR, SCREEN_WIDTH, 50)];
    self.searchView.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.searchView];
    
    
//    self.isCustomTable = YES;
//    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +44 +10, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 54)];
//    // 需要创建对象之后使用
//    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
//    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
//
//    [self.view addSubview:self.baseTableView];
//
//      __weak __typeof(self)weakSelf = self;
//
//    self.additionalBlock = ^(UITableViewCell * _Nonnull cell) {
//        weakSelf.index++;
//        YTYBaseTableViewCell * _cell = (YTYBaseTableViewCell *)cell;
////        NSLog(@"------->%d",weakSelf.index);
//        cell.textLabel.text = [NSString stringWithFormat:@"--%d",weakSelf.index];
//    };
    
}
- (void)updateAllData {
   // 更新头部
}



#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
    UIView *subV = [[UIView alloc] init];
    subV.backgroundColor = YTYRGBA(55, 141, 202,1);
    
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
    
    l1.text = @"入倉單編號";
    l2.text = @"來貨日期";
    l3.text = @"處理日期";
    
    
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subV).with.offset(0);
        make.left.equalTo(subV).with.offset(0);
        make.height.equalTo(subV.mas_height);
        make.width.equalTo(subV).with.multipliedBy(0.3);
    }];
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l1.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.equalTo(subV).with.multipliedBy(0.4);
    }];
    [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(subV).with.offset(0);
       make.left.equalTo(l2.mas_right).with.offset(0);
       make.height.equalTo(subV.mas_height);
       make.width.equalTo(subV).with.multipliedBy(0.3);
    }];
    
    return  subV;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [UITableViewCell initCellWithCellView:tableView reuseIdentifier:@"WarehouseCell"];
//    cell.nestingTableView = tableView;
//
////    cell.numLabel.text = @"產品編號\nR77368";
////    cell.nameLabel.text = @"產品名稱\n 32oz DPE White Paper Cup";
////    cell.priceLabel.text = @"$1000 /包";
////    cell.priceLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightBold];
////    cell.icon.image =  [UIImage imageNamed:@"paper"];
////    [cell.numLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12] ];
////     [cell.nameLabel  setRangeOfString:@"\n" lineSpacing:5 firstFont:setArialFont(12) tailFont:[UIFont systemFontOfSize:12]];
//    return  cell;
//
//}

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
