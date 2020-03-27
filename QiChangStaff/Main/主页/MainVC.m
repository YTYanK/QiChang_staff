//
//  MainVC.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/3/27.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"这是个首页";
       [[UINavigationBar appearance] setTranslucent:NO];
       [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
       [[UINavigationBar appearance] setShadowImage:[UIImage new]];
   
   
    // Do any additional setup after loading the view from its nib.
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
