//
//  WYNewsListViewController.m
//  网易新闻
//
//  Created by swift on 16/6/15.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYNewsListViewController.h"

static NSString *cellId = @"cellId";

@interface WYNewsListViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;

@end

@implementation WYNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 加载数据
- (void)loadData {
    
    [[CZNetworkManager sharedManager]newsListWithChannel:@"T1348649079062" start:0 completion:^(NSArray *array, NSError *error) {
        NSLog(@"%@",array);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    //设置cell
    cell.textLabel.text = @(indexPath.row).description;
    //返回cell
    return cell;
}

#pragma mark - 设置界面
- (void)setupUI {
 
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:tv];
    
    //自动布局
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //注册原型cell
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    //设置数据源,代理
    tv.dataSource = self;
    tv.delegate = self;
    
    //记录成员变量
    _tableView = tv;
}


@end
