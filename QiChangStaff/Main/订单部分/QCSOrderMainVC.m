//
//  QCSOrderMainVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/15.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "QCSOrderMainVC.h"
#import "CKSlideMenu.h"
#import "QCSOrderListVC.h"

@interface QCSOrderMainVC ()

@property (strong, nonatomic) CKSlideMenu *slideMenu;
@property (assign, nonatomic) int selectIndex;
@end

@implementation QCSOrderMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
      
    
    [self setAllInitSubView];
    [self updateAllData];
  
}

- (void)setAllInitSubView {
    
    
    self.title = @"訂單列表";
    self.view.backgroundColor = NAV_COLOR;
    self.navigationItem.leftBarButtonItem = [YTYTools obtainBackItemWithTarget:self action:@selector(backClick) image:[[UIImage imageNamed:@"back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic]];
    
    
   NSArray *titles = @[@"未派送",@"已派送", @"已審核"];
   NSMutableArray *_arrVC = [NSMutableArray array];
   for (int i = 0;  i < titles.count; i++) {
       QCSOrderListVC *vc = [[QCSOrderListVC alloc] init];
       vc.view.backgroundColor = UIColor.redColor;  //YTYRGB_RANDOM;
       [_arrVC addObject:vc];
   }
     
     
     // Do any additional setup after loading the view.
     self.slideMenu = [[CKSlideMenu alloc] initWithFrame:CGRectMake(0, SCREEN_NAV_BAR, SCREEN_WIDTH, 40) titles:titles childControllers:_arrVC];
        self.slideMenu.titleStyle = Gradient;
        self.slideMenu.bgColor = NO;
        self.slideMenu.selectedBgColor = NAV_COLOR;
        self.slideMenu.selectedColor = UIColor.whiteColor;
        self.slideMenu.unSelectedColor = UIColor.greenColor;
        self.slideMenu.indicatorStyle = styleStretch;  //stfollowText
        self.slideMenu.bottomPadding = 0;
    [self.slideMenu.line setHidden:YES];
   
       __weak __typeof(self)weakSelf = self;
        self.slideMenu.menuBlock = ^(UILabel * _Nonnull menu, UIViewController * _Nonnull vc2, int index) {
            weakSelf.selectIndex = index;
            QCSOrderListVC  *__vc = (QCSOrderListVC *)vc2;
           // [__vc.header beginRefreshing];
            
        };
        [self.view addSubview:self.slideMenu];
}

- (void)updateAllData {

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

// 返回事件
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
