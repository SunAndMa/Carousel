//
//  SJTTextCarousel.h
//  XLsn0wTextCarousel
//
//  Created by 孙继桐 on 2019/2/19.
//  Copyright © 2019 XLsn0w. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTTextInfoView.h"
#import "SJTDataSourceModel.h"

@interface SJTTextCarousel : UIView
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) SJTTextInfoView *currentTextInfoView;
@property (nonatomic, strong) SJTTextInfoView *hiddenTextInfoView;
@property (nonatomic, assign) NSTimeInterval autoTimeInterval;

- (void)stopTimer;
//防止内存泄露
- (void)destroyNSTimer;
@end


