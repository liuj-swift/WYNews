//
//  WYChannelView.h
//  网易新闻
//
//  Created by swift on 16/6/25.
//  Copyright © 2016年 swift. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYChannel;

@interface WYChannelView : UIView

/**
 *  从 XIB 加载并返回视图
 */
+ (instancetype)channelView;

/**
 *  频道列表的数组
 */
@property (nonatomic,strong) NSArray <WYChannel *> *channelList;

@end
