//
//  ProductCell.h
//  QiChangStaff
//
//  Created by POP3mac on 2020/4/30.
//  Copyright © 2020 YTYanK. All rights reserved.
//

#import <YTYCoreFramework/YTYCoreFramework.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductCell : YTYBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *product;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UITextField *numberValue;

@end

NS_ASSUME_NONNULL_END
