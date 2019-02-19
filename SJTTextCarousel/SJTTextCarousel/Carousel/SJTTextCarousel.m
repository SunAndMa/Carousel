//
//  SJTTextCarousel.m
//  XLsn0wTextCarousel
//
//  Created by 孙继桐 on 2019/2/19.
//  Copyright © 2019 XLsn0w. All rights reserved.
//

#import "SJTTextCarousel.h"

@interface SJTTextCarousel ()
{
    int count;
    int page;
    int flag;
    NSMutableArray *_dataSourceArray;
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *currentView;
@property (nonatomic, strong) UIView * hidenView;

@end

@implementation SJTTextCarousel

- (NSMutableArray *)dataArr {
    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    count = 0;
    flag = 0;
    self.layer.masksToBounds = YES;
    
    [self createCurrentView];
    [self createHiddenView];
    [self initTimer];
    
}

- (void)setDataSourceArray:(NSMutableArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    SJTDataSourceModel *currentTopModel = _dataSourceArray[count];
    SJTDataSourceModel *currentBottomModel = _dataSourceArray[count + 1];
    self.currentTextInfoView.topModel = currentTopModel;
    self.currentTextInfoView.bottomModel = currentBottomModel;
}

- (void)initTimer {
    _autoTimeInterval = 3;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:_autoTimeInterval target:self selector:@selector(carouselTimerEvent) userInfo:nil repeats:YES];
}

- (void)carouselTimerEvent {
    count += 2;
    if (count >= _dataSourceArray.count) {
        count = 0;
    }
    //要增加判断count+ 1 没有值的情况下
    if (flag == 1) {
        SJTDataSourceModel *currentTopModel = _dataSourceArray[count];
        SJTDataSourceModel *currentBottomModel;
        
        if (count + 1 >= _dataSourceArray.count) {
            currentBottomModel = nil;
        }
        currentBottomModel = _dataSourceArray[count + 1];
        self.currentTextInfoView.topModel = currentTopModel;
        self.currentTextInfoView.bottomModel = currentBottomModel;
        
    }
    
    if (flag == 0) {
        SJTDataSourceModel *hiddenTopModel = _dataSourceArray[count];
        SJTDataSourceModel *hiddenBottomModel;
        if (count + 1 >= _dataSourceArray.count) {
            hiddenBottomModel = nil;
        }
        hiddenBottomModel = _dataSourceArray[count + 1];
        
        self.hiddenTextInfoView.topModel = hiddenTopModel;
        self.hiddenTextInfoView.bottomModel = hiddenBottomModel;
    }
    
    if (flag == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.currentView.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            flag = 1;
            self.currentView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }];
        [UIView animateWithDuration:0.5 animations:^{
            self.hidenView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:nil];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.hidenView.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            flag = 0;
            self.hidenView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.currentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:nil];
    }
}

- (void)createCurrentView {
    SJTDataSourceModel *topModel = _dataSourceArray[count];
    SJTDataSourceModel *bottomModel;
    if (count + 1 >= _dataSourceArray.count) {
        bottomModel = nil;
    }
    bottomModel = _dataSourceArray[count + 1];
    
    self.currentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.currentView];
    
    self.currentTextInfoView = [[SJTTextInfoView alloc] init];
    self.currentTextInfoView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.currentTextInfoView.topModel = topModel;
    self.currentTextInfoView.bottomModel = bottomModel;
    
    [self.currentView addSubview:self.currentTextInfoView];
}

- (void)createHiddenView {
    SJTDataSourceModel *topModel = _dataSourceArray[count];
    SJTDataSourceModel *bottomModel;
    if (count + 1 >= _dataSourceArray.count) {
        bottomModel = nil;
    }
    bottomModel = _dataSourceArray[count + 1];
    
    self.hidenView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.hidenView];
    
    self.hiddenTextInfoView = [[SJTTextInfoView alloc] init];
    self.hiddenTextInfoView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.hiddenTextInfoView.topModel = topModel;
    self.hiddenTextInfoView.bottomModel = bottomModel;
    
    [self.hidenView addSubview:self.hiddenTextInfoView];
}


- (void)destroyNSTimer {
    [self stopTimer];
}

- (void)stopTimer {
    if ([self.timer isValid] == YES) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
