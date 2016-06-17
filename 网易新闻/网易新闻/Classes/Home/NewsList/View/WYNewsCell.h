//
//  WYNewsCell.h
//  网易新闻
//
//  Created by swift on 16/6/17.
//  Copyright © 2016年 swift. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraIcon;


@end
