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
@property   (nonatomic, strong) UIView      *rightView;
@property   (nonatomic, strong) UITableView *midView;
@property   (nonatomic, strong) LZFixView   *mainView;

@end

@implementation LZFixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"吸附浮层View效果预览";
    
    self.mainView.middleView = self.midView;
    self.mainView.topView    = self.topView;
    self.mainView.leftView   = self.leftView;
    self.mainView.bottomView = self.bottomview;
    self.mainView.rightView  = self.rightView;
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
        //_midView.bounces = NO;
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

- (void)setFixTop:(BOOL)fixTop
{
    _fixTop = fixTop;
    self.mainView.fixTop = fixTop;
}

- (void)setFixLeft:(BOOL)fixLeft
{
    _fixLeft = fixLeft;
    self.mainView.fixLeft = fixLeft;
}

- (void)setFixBtm:(BOOL)fixBtm
{
    _fixBtm = fixBtm;
    self.mainView.fixBottom = fixBtm;
}

- (void)setFixRight:(BOOL)fixRight
{
    _fixRight = fixRight;
    self.mainView.fixRight = fixRight;
}

- (void)setFixInBtm:(BOOL)fixInBtm
{
    _fixInBtm = fixInBtm;
    self.mainView.fixBottomInside = fixInBtm;
}

- (void)setFixInRight:(BOOL)fixInRight
{
    _fixInRight = fixInRight;
    self.mainView.fixRightInside = fixInRight;
}

- (void)setBounceTable:(BOOL)bounceTable
{
    _bounceTable = bounceTable;
    self.midView.bounces = bounceTable;
}

- (void)setBounceTop:(BOOL)bounceTop
{
    _bounceTop = bounceTop;
    self.mainView.topBounces = bounceTop;
}

- (void)setBounceLeft:(BOOL)bounceLeft
{
    _bounceLeft = bounceLeft;
    self.mainView.leftBounces = bounceLeft;
}

- (void)setBounceBottom:(BOOL)bounceBottom
{
    _bounceBottom = bounceBottom;
    self.mainView.bottomBounces = bounceBottom;
}

- (void)setBounceRight:(BOOL)bounceRight
{
    _bounceRight = bounceRight;
    self.mainView.rightBounces = bounceRight;
}
@end
