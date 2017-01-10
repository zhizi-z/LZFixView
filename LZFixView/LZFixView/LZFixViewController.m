//
//  LZFixViewController.m
//  LZFixView
//
//  Created by zlh on 17/1/5.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import "LZFixViewController.h"
#import "LZFixView.h"

@interface LZFixViewController () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property   (nonatomic, strong) UIImageView *topView;
@property   (nonatomic, strong) UIImageView *bottomview;
@property   (nonatomic, strong) UIImageView *leftView;
@property   (nonatomic, strong) UIView *rightView;
@property   (nonatomic, strong) UITableView *midView;
@property   (nonatomic, strong) LZFixView   *mainView;

@property   (nonatomic, strong) NSArray     *aryValues;
@end

@implementation LZFixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView.middleView = self.midView;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //notice2: 重新布局subView时需要调用这个方法重新排布topView，bottomView，leftView，rightView
    [self.mainView adjustSideViewsLocationForView:self.midView];
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.view.backgroundColor = [UIColor whiteColor];
        self.automaticallyAdjustsScrollViewInsets = NO;
        //notice1: 在给topView，bottomView, leftView, rightView, middleView赋值之前就要将mainView添加到view上
        [self.view addSubview:self.mainView];
    }
    return self;
}

#pragma mark - public method
- (instancetype)initWithFixTop:(BOOL)fix
{
    if (self = [self init])
    {
        self.mainView.topView = self.topView;
        self.mainView.fixTop = fix;
    }
    return self;
}

- (instancetype)initWithFixBtm:(BOOL)fix
{
    if (self = [self init])
    {
        self.mainView.bottomView = self.bottomview;
        self.mainView.fixBottom = fix;
    }
    return self;
}

- (instancetype)initWithFixLeft:(BOOL)fix
{
    if (self = [self init])
    {
        self.mainView.leftView = self.leftView;
        self.mainView.fixLeft = fix;
    }
    return self;
}

- (instancetype)initWithFixRight:(BOOL)fix
{
    if (self = [self init])
    {
        self.mainView.rightView = self.rightView;
        self.mainView.fixRight = fix;
    }
    return self;
}

- (instancetype)initWithFixTop:(BOOL)fixTop AndFixBtm:(BOOL)fixBtm
{
    if (self = [self init])
    {
        self.mainView.topView = self.topView;
        self.mainView.fixTop = fixTop;
        
        self.mainView.bottomView = self.bottomview;
        self.mainView.fixBottom = fixBtm;
    }
    return self;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{//notice3: 滚动middleView时需要调用这个方法重新排布topView，bottomView，leftView，rightView
    [self.mainView adjustSideViewsLocationForView:scrollView];
}

#pragma mark - UITableView Delegate & datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.aryValues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"LZFixViewControllerCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.aryValues[indexPath.row];
    return cell;
}

#pragma mark - getter
- (UIImageView *)topView
{
    if (!_topView)
    {
        _topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        _topView.image = [UIImage imageNamed:@"topPic.jpeg"];
    }
    return _topView;
}

- (UIImageView *)bottomview
{
    if (!_bottomview)
    {
        _bottomview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        _bottomview.image = [UIImage imageNamed:@"btmPic.jpeg"];
    }
    return _bottomview;
}

- (UIView *)leftView
{
    if (!_leftView)
    {
        _leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, self.view.frame.size.height)];
        _leftView.image = [UIImage imageNamed:@"leftPic.jpeg"];
    }
    return _leftView;
}

- (UIView *)rightView
{
    if (!_rightView)
    {
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, self.view.frame.size.height)];
        _rightView.backgroundColor = [UIColor cyanColor];
    }
    return _rightView;
}

- (UITableView *)midView
{
    if (!_midView)
    {
        _midView = [[UITableView alloc] initWithFrame:self.mainView.frame];
        _midView.bounces = NO;
        _midView.delegate = self;
        _midView.dataSource = self;
    }
    return _midView;
}

- (LZFixView *)mainView
{
    if (!_mainView)
    {
        //_mainView = [[LZFixView alloc] initWithFrame:self.view.frame];
        _mainView = [[LZFixView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    }
    return _mainView;
}

- (NSArray *)aryValues
{
    if (!_aryValues)
    {
        _aryValues = [NSArray arrayWithObjects:@"教父 The Godfathertop", @"肖申克的救赎 The Shawshank Redemption", @"教父续集 The Godfather: Part II", @"黄金三镖客 Buono, il brutto, il cattivo, Il", @"低俗小说 Pulp Fiction", @"辛德勒的名单", @"星球大战5：帝国反击战 Star Wars: Episode V - The Empire Strikes Back", @"飞越疯人院 One Flew Over the Cuckoo's Nest", @"卡萨布兰卡 Casablanca", @"魔戒3:王者归来 The Lord of the Rings: The Return of the King", @"七武士 Shichinin no samurai", @"星球大战 Star Wars", @"十二怒汉 12 Angry Men", @"后窗 Rear Window", @"好家伙 Goodfellas", @"夺宝奇兵 Raiders of the Lost Ark", @"魔戒1：魔戒现身 The Lord of the Rings: The Fellowship of the Ring", @"上帝之城 Cidade de Deus", @"西部往事 C'era una volta il West", @"普通嫌疑犯 The Usual Suspects",  @"惊魂记 Psycho", @"奇爱博士 Dr. Strange love", @"西北偏北 North by Northwest", @"公民凯恩 Citizen Kane", @"沉默的羔羊 The Silence of the Lambs", @"魔戒2:双塔奇兵 The Lord of the Rings: The Two Towers", @"记忆碎片 Memento", @"搏击俱乐部Fight Club", @"日落大道 Sunset Blvd", @"阿拉伯的劳伦斯 Lawrence of Arabia", nil];
    }
    return _aryValues;
}
@end
