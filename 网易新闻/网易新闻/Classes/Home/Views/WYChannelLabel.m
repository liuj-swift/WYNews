//
//  WYChannelLabel.m
//  网易新闻
//
//  Created by swift on 16/6/26.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYChannelLabel.h"

#define kNormalSize 14
#define kSeletedSize 18

@implementation WYChannelLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title {
    
    //1.实例化标签
    WYChannelLabel *l = [self cz_labelWithText:title fontSize:kSeletedSize color:[UIColor blackColor]];
    
    //2.设置文本对齐方式
    l.textAlignment = NSTextAlignmentCenter;
    
    //3.设置小字体
    l.font = [UIFont systemFontOfSize:kNormalSize];
    
    //4.返回标签,返回的 bounds 是大字体的撑开的 bounds
    return l;
}

@end
