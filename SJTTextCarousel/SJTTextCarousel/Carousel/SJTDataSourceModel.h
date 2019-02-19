//
//  SJTDataSourceModel.h
//  XLsn0wTextCarousel
//
//  Created by 孙继桐 on 2019/2/18.
//  Copyright © 2019 XLsn0w. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJTDataSourceModel : NSObject
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *URLString;

+ (instancetype)dataSourceModelWithType:(NSString *)type title:(NSString *)title URLString:(NSString *)URLString;
@end

NS_ASSUME_NONNULL_END
