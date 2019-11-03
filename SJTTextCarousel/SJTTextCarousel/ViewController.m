//
//  ViewController.m
//  SJTTextCarousel
//
//  Created by 孙继桐 on 2019/2/19.
//  Copyright © 2019 Sun. All rights reserved.
//

#import "ViewController.h"
#import "SJTTextCarousel.h"

@interface ViewController ()<SJTTextInfoViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];
}

- (void)createUI {
    self.dataSourceArray = [NSMutableArray array];
    NSArray *typeArray = @[@"1", @"2", @"3", @"4",@"5",@"6"];
    NSArray *titleArray = @[@"111111", @"222222", @"333333", @"444444",@"555555",@"666666"];
    NSArray *URLArray = @[@"http://0", @"http://1", @"http://2", @"http://3",@"http://4",@"http://5"];
    
    for (int i = 0; i < titleArray.count; i ++) {
        NSString *title = [titleArray objectAtIndex:i];
        NSString *URLString = [URLArray objectAtIndex:i];
        NSString *type = [typeArray objectAtIndex:i];
        SJTDataSourceModel *model = [SJTDataSourceModel dataSourceModelWithType:type title:title URLString:URLString];
        [self.dataSourceArray addObject:model];
    }
    
    SJTTextCarousel *view = [[SJTTextCarousel alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width - 70, 70)];
    view.dataSourceArray = self.dataSourceArray;
    view.currentTextInfoView.delegate = self;
    view.hiddenTextInfoView.delegate = self;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)handleTopEventWithURLString:(NSString *)URLString {
    NSLog(@"URLString===%@", URLString);
}

- (void)getTopDataSourceModel:(SJTDataSourceModel *)topDataSourceModel {
    NSLog(@"第一个 %@ %@ %@", topDataSourceModel.type, topDataSourceModel.title, topDataSourceModel.URLString);
}

- (void)getBottomDataSourceModel:(SJTDataSourceModel *)bottomDataSourceModel {
    NSLog(@"第二个 %@ %@ %@", bottomDataSourceModel.type, bottomDataSourceModel.title, bottomDataSourceModel.URLString);
    
    
    
}

- (void)handleBottomEventWithURLString:(NSString *)URLString {
    NSLog(@"URLString===%@", URLString);
}
@end
