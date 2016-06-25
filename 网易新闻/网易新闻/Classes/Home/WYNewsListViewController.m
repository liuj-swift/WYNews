//
//  WYNewsListViewController.m
//  网易新闻
//
//  Created by swift on 16/6/15.
//  Copyright © 2016年 swift. All rights reserved.
//

#import "WYNewsListViewController.h"
#import "WYNewsListItem.h"
#import "WYNewsCell.h"

static NSString *normalCellId = @"normalCellId";
static NSString *extraCellId = @"extraCellId";
static NSString *bigImageCellId = @"bigImageCellId";
static NSString *headerCellId = @"headerCellId";

@interface WYNewsListViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tableView;

/**
 *  新闻列表数组
 */
@property (nonatomic,strong) NSMutableArray <WYNewsListItem *> *newsList;

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
    
    // c.3g.163.com/nc/article/list/c/0-20.html
    [[CZNetworkManager sharedManager]newsListWithChannel:@"T1348647853363" start:0 completion:^(NSArray *array, NSError *error) {
        //字典的数组 - 字典转模型
        NSLog(@"%@",array);
        
        //字典转模型
        NSArray *list = [NSArray yy_modelArrayWithClass:[WYNewsListItem class] json:array];
        
        //设置给 新闻数组
        self.newsList = [NSMutableArray arrayWithArray:list];
        
        //刷新表格
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //设置cell
    // cell.textLabel.text = _newsList[indexPath.row].title;
    //根据模型判断 cellId
    WYNewsListItem *model = _newsList[indexPath.row];
    
    NSString *cellId;
    if (model.hasHead) {
        cellId = headerCellId;
    }else if (model.imgType) {
        cellId = bigImageCellId;
    }else if (model.imgextra.count > 0) {
        cellId = extraCellId;
    }else {
        cellId = normalCellId;
    }
    
    WYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.newsItem = model;

    
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
    // [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
     [tv registerNib:[UINib nibWithNibName:@"WYNewsNormalCell" bundle:nil] forCellReuseIdentifier:normalCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsExtraImagesCell" bundle:nil] forCellReuseIdentifier:extraCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsBigImageCell" bundle:nil] forCellReuseIdentifier:bigImageCellId];
    [tv registerNib:[UINib nibWithNibName:@"WYNewsHeaderCell" bundle:nil] forCellReuseIdentifier:headerCellId];
    
    //设置自动行高
    tv.estimatedRowHeight = 100;
    tv.rowHeight = UITableViewAutomaticDimension;
    
    //设置数据源,代理
    tv.dataSource = self;
    tv.delegate = self;
    
    //记录成员变量
    _tableView = tv;
}


@end
