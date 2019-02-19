//
//  SJTTextInfoView.h
//  XLsn0wTextCarousel
//
//  Created by 孙继桐 on 2019/2/18.
//  Copyright © 2019 XLsn0w. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTDataSourceModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SJTTextInfoViewDelegate <NSObject>

- (void)handleTopEventWithURLString:(NSString *)URLString;
- (void)handleBottomEventWtihURLString:(NSString *)URLString;

- (void)getTopDataSourceModel:(SJTDataSourceModel *)topDataSourceModel;
- (void)getBottomDataSourceModel:(SJTDataSourceModel *)bottomDataSourceModel;

@end

@interface SJTTextInfoView : UIView

@property (nonatomic, weak) id<SJTTextInfoViewDelegate> delegate;

@property (nonatomic, strong) SJTDataSourceModel *topModel;
@property (nonatomic, strong) SJTDataSourceModel *bottomModel;

@end

NS_ASSUME_NONNULL_END
