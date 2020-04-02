//
//  AppDelegate.m
//  QiChangStaff
//
//  Created by POP3mac on 2020/3/26.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (LoginVC *)loginPage {
    if (_loginPage == nil) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:NULL];
          _loginPage = [storyboard instantiateInitialViewController];
    }
    return _loginPage;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


+ (void)logout {
   
    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    UIWindow* window = nil;
         
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
        {
                if (windowScene.activationState == UISceneActivationStateForegroundActive)
                {
                    window = windowScene.windows.firstObject;
                    break;
                }
        }
    }else{
       window = [[UIApplication sharedApplication] delegate].window;
    }
    
    [UIView transitionWithView:window duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        window.rootViewController = appDelegate.loginPage;
        [window makeKeyAndVisible];
        [UIView setAnimationsEnabled:oldState];
    } completion:nil];
     [NSUD setValue:nil forKey:LOGIN_TOKEN];
}

+ (void)login:(NSString *)token {
         UIWindow* window = nil;
           if (@available(iOS 13.0, *)) {
               for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
               {
                       if (windowScene.activationState == UISceneActivationStateForegroundActive)
                       {
                           window = windowScene.windows.firstObject;

                           break;
                       }
               }
           }else{
              window = [[UIApplication sharedApplication] delegate].window;
           }
           
           [UIView transitionWithView:window duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{

               UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:NULL];
                    UINavigationController *nav = [storyboard instantiateInitialViewController];

               BOOL oldState = [UIView areAnimationsEnabled];
               [UIView setAnimationsEnabled:NO];
               window.rootViewController = nav;
               [window makeKeyAndVisible];
               [UIView setAnimationsEnabled:oldState];
           } completion:nil];
          [NSUD setValue:token forKey:LOGIN_TOKEN];
}
@end
