//
//  AppDelegate.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/3/26.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainVC.h"
#import "LoginVC.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) LoginVC*loginPage;

+ (void)login:(NSString *)token;
+ (void)logout;
@end

