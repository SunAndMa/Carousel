//
//  SJTTextInfoView.m
//  XLsn0wTextCarousel
//
//  Created by 孙继桐 on 2019/2/18.
//  Copyright © 2019 XLsn0w. All rights reserved.
//

#import "SJTTextInfoView.h"

@interface SJTTextInfoView ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) UIButton *bottomButton;

@end

@implementation SJTTextInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawUI];
    }
    return self;
}

- (void)drawUI {
    self.topLabel = [UILabel new];
    [self addSubview:self.topLabel];
    self.topLabel.frame = CGRectMake(10, 10, 35, 25);
    self.topLabel.layer.borderWidth = 1;
    self.topLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    self.topLabel.textColor = [UIColor orangeColor];
    self.topLabel.layer.cornerRadius = 5;
    self.topLabel.layer.masksToBounds = YES;
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont systemFontOfSize:13];
    
    self.bottomLabel = [UILabel new];
    [self addSubview:self.bottomLabel];
    self.bottomLabel.frame = CGRectMake(10, 40, 35, 25);
    self.bottomLabel.layer.borderWidth = 1;
    self.bottomLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.bottomLabel.textColor = [UIColor blueColor];
    self.bottomLabel.layer.cornerRadius = 5;
    self.bottomLabel.layer.masksToBounds = YES;
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.font = [UIFont systemFontOfSize:13];
    
    self.topButton = [UIButton new];
    [self addSubview:self.topButton];
    self.topButton.frame = CGRectMake(CGRectGetMaxX(self.topLabel.frame) + 5, 13, 200, 21);
    self.topButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [self.topButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.topButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.topButton addTarget:self action:@selector(topButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    self.bottomButton = [UIButton new];
    [self addSubview:self.bottomButton];
    self.bottomButton.frame = CGRectMake(CGRectGetMaxX(self.bottomLabel.frame) + 5, 43, 200, 21);
    self.bottomButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    [self.bottomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.bottomButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.bottomButton addTarget:self action:@selector(bottomButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)topButtonEvent:(UIButton *)topButton {
    [self.delegate handleTopEventWithURLString:self.topModel.URLString];
}

- (void)bottomButtonEvent:(UIButton *)bottonButton {
    [self.delegate handleBottomEventWtihURLString:self.bottomModel.URLString];
}

- (void)setTopModel:(SJTDataSourceModel *)topModel {
    _topModel = topModel;
    NSString *title = [NSString stringWithFormat:@"%@",[topModel.title stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    [self.topButton setTitle:title forState:UIControlStateNormal];
    self.topLabel.text = topModel.type;
    [self.delegate getTopDataSourceModel:topModel];
}

- (void)setBottomModel:(SJTDataSourceModel *)bottomModel {
    _bottomModel = bottomModel;
    NSString *title = [NSString stringWithFormat:@"%@",[bottomModel.title stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    [self.bottomButton setTitle:title forState:UIControlStateNormal];
    self.bottomLabel.text = bottomModel.type;
    [self.delegate getBottomDataSourceModel:bottomModel];
}

@end
