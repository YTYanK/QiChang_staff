//
//  QCSAreaVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/3.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSAreaVC.h"
#import "AreaCell.h"

#import "QCSAreaDetailsVC.h"

@interface QCSAreaVC ()

@end

@implementation QCSAreaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAllInitSubView];
    [self updateAllData];
}
#pragma mark - 初始化设置
- (void)setAllInitSubView {
    self.title = @"區域";
    self.view.backgroundColor = NAV_COLOR;
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    // 需要创建对象之后使用
    self.baseTableView.backgroundColor = YTYRGBA(242, 242, 242, 1);
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    
        self.additionalBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
            AreaCell *newCell = (AreaCell *)cell;
            [newCell.cbm removeFromSuperview];
            [newCell.date removeFromSuperview];
            [newCell.ascription removeConstraints:@[newCell.ascriptionH]];
            newCell.ascription.numberOfLines = 2;
            newCell.ascriptionTop.constant = 0;
            newCell.ascriptionW.constant = 200;
            newCell.ascriptionH.constant = 18;
            
            newCell.ascription.text = [NSString stringWithFormat:@"所属\n仓库%ld",(long)indexPath.row];
            [newCell.ascription setRangeOfString:@"\n" lineSpacing:2 firstFont:[UIFont systemFontOfSize:10 weight:UIFontWeightBold] firstColor:YTYRGBA(81, 165, 216, 1) tailFont:[UIFont systemFontOfSize:12] tailColor:UIColor.blackColor];
            };
           
}
- (void)updateAllData {
   // 更新头部
}

// 返回事件
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return 170;
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaCell *cell = [AreaCell initCellWithCellView:tableView reuseIdentifier:@"AreaCell"];
    cell.nestingTableView = tableView;
    if ([[NSUD objectForKey:LOGIN_ROLE_TYPE] isEqual: RoleTypeStorekeeper]) {
         self.additionalBlock(cell, indexPath);
    }
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QCSAreaDetailsVC * details = [[QCSAreaDetailsVC alloc] init];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
