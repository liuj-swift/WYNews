//
//  WYChannelView.m
//  网易新闻
//
//  Created by swift on 16/6/25.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYChannelView.h"

@interface WYChannelView ()

@end

@implementation WYChannelView

+ (instancetype)channelView {
    UINib *nib = [UINib nibWithNibName:@"WYChannelView" bundle:nil];
    
    return [nib instantiateWithOwner:nil options:nil].lastObject;
}

@end
