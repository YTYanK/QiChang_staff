//
//  QCSOrderListVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/15.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSOrderListVC.h"
#import "YTYLabel.h"
#import "YTYSearchView.h"
#import "OrderListCell.h"

#import "QCSOrderDetailsVC.h"


@interface QCSOrderListVC ()
@property (strong, nonatomic) YTYLabel * checkDate;

@property (strong, nonatomic) YTYSearchView *searchView;



@end

@implementation QCSOrderListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self setAllInitSubView];
    [self updateAllData];
}



- (void)setStringTag:(NSString *)stringTag {
    _stringTag = stringTag;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


#pragma mark - 初始化设置
- (void)setAllInitSubView {
    
    NSLog(@"？？？==》%@", self.title);
    
   
    
    
    
    self.view.backgroundColor = NAV_COLOR;
    self.searchView = [[YTYSearchView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
       [self.view addSubview:self.searchView];
       
       
    self.checkDate = [[YTYLabel alloc] initWithFrame:CGRectMake(0, self.searchView.size.height, SCREEN_WIDTH, 44)];
    self.checkDate.backgroundColor = NAV_COLOR;
    self.checkDate.textColor = UIColor.whiteColor;
    self.checkDate.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.checkDate];
    
    
    self.isCustomTable = YES;
    self.baseTableView = [[UITableView alloc] init];
    if (IS_IPHONE_X) {
      self.baseTableView.frame = CGRectMake(0,  94, SCREEN_WIDTH,  self.view.size.height - 94 -  40 - SCREEN_NAV_BAR);
    }else {
      self.baseTableView.frame = CGRectMake(0,  94, SCREEN_WIDTH,  self.view.size.height - 94 -  40 - SCREEN_NAV_BAR);
    }
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.baseTableView];
    
}
- (void)updateAllData {
   // 更新头部
    self.checkDate.text = @"請選擇查詢日期";
}



#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
    return  nil;//[HeaderVIew obtainGradientLayerViewFrame:frame viewFrame:frame];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListCell *cell = [OrderListCell initCellWithCellView:tableView reuseIdentifier:@"OrderListCell"];
    cell.nestingTableView = tableView;
    cell.state.text = self.stringTag;
    
    if (self.view.tag == 0) {
        cell.state.backgroundColor =  UIColor.redColor;
    }else if(self.view.tag == 1){
        cell.state.backgroundColor = YTYRGBA(81, 165, 216, 1);
    }else {
        cell.state.backgroundColor = YTYRGBA(0, 146, 63, 1);
    }
    
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QCSOrderDetailsVC * details = [[QCSOrderDetailsVC alloc] init];
    details.state = self.stringTag;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
