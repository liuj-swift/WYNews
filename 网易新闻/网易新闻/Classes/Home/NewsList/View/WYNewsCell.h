//
//  WYNewsCell.h
//  网易新闻
//
//  Created by swift on 16/6/17.
//  Copyright © 2016年 swift. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYNewsListItem;

@interface WYNewsCell : UITableViewCell
/**
 *  新闻项模型
 */
@property (nonatomic,strong) WYNewsListItem *newsItem;

@end
