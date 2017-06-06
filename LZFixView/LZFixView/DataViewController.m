//
//  DataViewController.m
//  LZFixView
//
//  Created by zlh on 17/1/13.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import "DataViewController.h"
#import "LZCheckButton.h"

@interface DataViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   LZCheckButton   *allCheckButton;
@property (nonatomic, strong)   UITableView     *tableView;
@property (nonatomic, strong)   NSArray         *dataSource;
@property (nonatomic, strong)   NSMutableDictionary *checkButtons;
@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择数据";
    
    self.dataSource = [NSArray arrayWithObjects:@"教父 The Godfathertop", @"肖申克的救赎 The Shawshank Redemption", @"教父续集 The Godfather: Part II", @"黄金三镖客 Buono, il brutto, il cattivo, Il", @"低俗小说 Pulp Fiction", @"辛德勒的名单", @"星球大战5：帝国反击战 Star Wars: Episode V - The Empire Strikes Back", @"飞越疯人院 One Flew Over the Cuckoo's Nest", @"卡萨布兰卡 Casablanca", @"魔戒3:王者归来 The Lord of the Rings: The Return of the King", @"七武士 Shichinin no samurai", @"星球大战 Star Wars", @"十二怒汉 12 Angry Men", @"后窗 Rear Window", @"好家伙 Goodfellas", @"夺宝奇兵 Raiders of the Lost Ark", @"魔戒1：魔戒现身 The Lord of the Rings: The Fellowship of the Ring", @"上帝之城 Cidade de Deus", @"西部往事 C'era una volta il West", @"普通嫌疑犯 The Usual Suspects",  @"惊魂记 Psycho", @"奇爱博士 Dr. Strange love", @"西北偏北 North by Northwest", @"公民凯恩 Citizen Kane", @"沉默的羔羊 The Silence of the Lambs", @"魔戒2:双塔奇兵 The Lord of the Rings: The Two Towers", @"记忆碎片 Memento", @"搏击俱乐部Fight Club", @"日落大道 Sunset Blvd", @"阿拉伯的劳伦斯 Lawrence of Arabia", nil];
    self.checkButtons = [[NSMutableDictionary alloc] init];
    for (NSInteger index = 0; index < self.dataSource.count; index++)
    {
        LZCheckButton *checkButton = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 5, 40, 30)];
        checkButton.delegate = self;
        [self.checkButtons setObject:checkButton forKey:@(index)];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    for (NSInteger index = 0; index < self.dataSource.count; index++)
    {
        LZCheckButton *checkButton = [self.checkButtons objectForKey:@(index)];
        if (checkButton.selected) [self.selectedData addObject:self.dataSource[index]];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"dataIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    LZCheckButton *chooseButton = [self.checkButtons objectForKey:@(indexPath.row)];
    [cell addSubview:chooseButton];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, tableView.frame.size.width - 40, 40)];
    textLabel.text = self.dataSource[indexPath.row];
    [cell addSubview:textLabel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    
    self.allCheckButton = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 5, 0, 0)];
    self.allCheckButton.tag = 100000;
    self.allCheckButton.delegate = self;
    [view addSubview:self.allCheckButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 200, 40)];
    label.text = @"全选";
    label.textColor = [UIColor redColor];
    [view addSubview:label];
    
    return view;
}

#pragma mark - LZCheckButton delegate
- (void)checkButtonDidClicked:(UIButton *)checkButton
{
    if (checkButton.tag == 100000)
    {
        NSArray *allButtons = [self.checkButtons allValues];
        for (LZCheckButton *button in allButtons)
        {
            button.selected = checkButton.selected;
        }
    }
    else{
        if (self.allCheckButton.selected) self.allCheckButton.selected = NO;
    }
}
@end
