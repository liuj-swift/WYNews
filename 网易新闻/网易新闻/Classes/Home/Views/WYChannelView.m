//
//  WYChannelView.m
//  网易新闻
//
//  Created by swift on 16/6/25.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYChannelView.h"
#import "WYChannel.h"
#import "WYChannelLabel.h"

@interface WYChannelView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation WYChannelView

+ (instancetype)channelView {
    UINib *nib = [UINib nibWithNibName:@"WYChannelView" bundle:nil];
    
    return [nib instantiateWithOwner:nil options:nil].lastObject;
    
}


/**
 *  设置数据
 */
- (void)setChannelList:(NSArray<WYChannel *> *)channelList {
    _channelList = channelList;
    
    //1. 初始化数据准备
    CGFloat x = 20;
    CGFloat margin = 8;
    CGFloat height = _scrollView.bounds.size.height;
    
    //向 scrollView 添加控件
    for (WYChannel *channel in channelList) {
        //1.创建标签 - 已经计算好合适的 label 的宽度
        WYChannelLabel *l = [WYChannelLabel channelLabelWithTitle:channel.tname];
        
        //2. 设置label的位置
        l.frame = CGRectMake(x, 0, l.bounds.size.width, height);
        
        //3. 递增 x
        x += l.bounds.size.width +margin;
        
        //4.添加到滚动视图
        [_scrollView addSubview:l]; 
    }
    
    
    //设置 scrollView 的contentSize
    _scrollView.contentSize = CGSizeMake(x, height);
    
    // 取消滚动指示器
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
}


@end
