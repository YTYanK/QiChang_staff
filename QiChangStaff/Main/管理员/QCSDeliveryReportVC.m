//
//  QCSDeliveryReportVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/14.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSDeliveryReportVC.h"
#import "YTYSearchView.h"
#import "DeliveryReportCell.h"

#import "QCSDeliveryDetailsVC.h"




@interface QCSDeliveryReportVC ()
@property(nonatomic, assign) int index;
@property (nonatomic, strong) YTYSearchView * searchView;
@end

@implementation QCSDeliveryReportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"本日派送記錄報告";
    self.view.backgroundColor = YTYRGBA(62, 146, 198, 1);
    
    
    self.searchView = [[YTYSearchView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR, SCREEN_WIDTH, 50)];
    [self.view addSubview:self.searchView];
    
    
    self.isCustomTable = YES;
  
    if (IS_IPHONE_X) {
      self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +self.searchView.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 26)];
    }else {
      self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR +self.searchView.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_NAV_BAR - 50)];
    }
    
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    [self.view addSubview:self.baseTableView];

 
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
    return 120;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DeliveryReportCell *cell = [DeliveryReportCell initCellWithCellView:tableView reuseIdentifier:@"DeliveryReportCell"];
    cell.nestingTableView = tableView;
    
    cell.icon.image = [UIImage imageNamed:@"logo"];
    cell.icon.backgroundColor = UIColor.redColor;
    cell.number.text = @"員工編號 382846583";
    cell.name.text = @"名稱\n陳大文";
    [cell.name setRangeOfString:@"\n" lineSpacing:6 firstFont:[UIFont systemFontOfSize:12] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:13] tailColor:UIColor.blackColor];

    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QCSDeliveryDetailsVC * details = [[QCSDeliveryDetailsVC alloc] init];
    [self.navigationController  pushViewController:details animated:YES];
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
