//
//  ProductView.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/5/7.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductView : UIView
 


@property (strong, nonatomic) UIButton * arrBtn;
@property (strong, nonatomic) UIButton * addBtn;


- (void)updateDataForDictionrary:(nonnull NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
