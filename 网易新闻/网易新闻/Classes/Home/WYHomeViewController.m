//
//  WYHomeViewController.m
//  网易新闻
//
//  Created by swift on 16/6/15.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYChannelView.h"

@implementation WYHomeViewController

- (void)viewDidLoad {

    [self setupUI];
}

#pragma mark - 设置界面
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor cz_randomColor];
    //1.添加频道视图
    WYChannelView *cv = [WYChannelView channelView];
    
    [self.view addSubview:cv];
    
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(38);
    }];
}

@end
