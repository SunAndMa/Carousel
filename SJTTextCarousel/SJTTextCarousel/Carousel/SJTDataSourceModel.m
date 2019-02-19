//
//  SJTDataSourceModel.m
//  XLsn0wTextCarousel
//
//  Created by 孙继桐 on 2019/2/18.
//  Copyright © 2019 XLsn0w. All rights reserved.
//

#import "SJTDataSourceModel.h"

@implementation SJTDataSourceModel

+ (instancetype)dataSourceModelWithType:(NSString *)type title:(NSString *)title URLString:(NSString *)URLString {
    SJTDataSourceModel *model = [[SJTDataSourceModel alloc] init];
    model.type = type;
    model.title = title;
    model.URLString = URLString;
    return model;
}

@end
