//
//  LZFixView.m
//  LZFixViewExample
//
//  Created by zlh on 16/9/9.
//  Copyright © 2016年 zlh. All rights reserved.
//

#import "LZFixView.h"
#import "UIScrollView+Extend.h"

@interface LZFixView()
@end

@implementation LZFixView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _topView = nil;
        _leftView = nil;
        _bottomView = nil;
        _rightView = nil;
        _middleView = nil;
        
        _fixTop = NO;
        _fixLeft = NO;
        _fixBottom = NO;
        _fixRight = NO;
        
        _fixBottomInside = NO;
        _fixRightInside = NO;
        
        _topBounces = NO;
        _leftBounces = NO;
        _bottomBounces = NO;
        _rightBounces = NO;
        
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:@"LZFixViewObserver"];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame" context:@"LZFixViewObserver"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self adjustSideViewsLocationForView:self.middleView];
}

#pragma mark - observer
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context {
    if ([keyPath isEqualToString:@"frame"])
    {
        if ([object isEqual:self])
        {
            self.middleView.frame = CGRectMake(self.middleView.frame.origin.x, self.middleView.frame.origin.y, self.frame.size.width, self.frame.size.height);
            [self adjustSideViewsLocationForView:self.middleView];
        }
    }
}

#pragma mark - overwrite setters
- (void)setTopView:(UIView *)topView
{
    topView.frame = CGRectMake(topView.frame.origin.x, 0, topView.frame.size.width, topView.frame.size.height);
    //If middleView was already added, we need to modify the contentInset of it
    if (self.middleView)
    {
        CGFloat offsetY = self.middleView.contentOffsetY;
        if (_topView){
            offsetY = offsetY + _topView.frame.size.height;
        }
        self.middleView.contentInsetTop = topView.frame.size.height;
        
        CGFloat actualHeight = self.middleView.frame.size.height - self.middleView.contentInsetTop - self.middleView.contentInsetBottom;
        CGFloat maskHeight = self.middleView.contentSize.height - actualHeight;//显示在表格外面的内容高度；
        if (offsetY > maskHeight && maskHeight > 0)
        {
            offsetY = self.middleView.contentSize.height - actualHeight;
        }        
        self.middleView.contentOffsetY = offsetY - topView.frame.size.height;
        if (!self.fixTop)
        {
            topView.frame = CGRectMake(topView.frame.origin.x, offsetY, topView.frame.size.width, topView.frame.size.height);
        }
    }
    
    if (_topView){
        [_topView removeFromSuperview];
    }
    _topView = topView;
    //Add topView to the top
    [self addSubview:_topView];
}

- (void)setLeftView:(UIView *)leftView
{
    leftView.frame = CGRectMake(0, leftView.frame.origin.y, leftView.frame.size.width, leftView.frame.size.height);
    //If middleView was already added, we need to modify the contentInset of it
    if (self.middleView)
    {
        CGFloat offsetX = self.middleView.contentOffsetX;
        if (_leftView){
            offsetX = offsetX + _leftView.frame.size.width;
        }
        self.middleView.contentInsetLeft = leftView.frame.size.width;
        self.middleView.contentOffsetX = offsetX - leftView.frame.size.width;
        if (!self.fixLeft)
        {
            leftView.frame = CGRectMake(offsetX, leftView.frame.origin.y, leftView.frame.size.width, leftView.frame.size.height);
        }
    }
    
    if (_leftView){
        [_leftView removeFromSuperview];
    }
    _leftView = leftView;
    //Add leftView to the left
    [self addSubview:_leftView];
}

- (void)setBottomView:(UIView *)bottomView
{
    bottomView.frame = CGRectMake(bottomView.frame.origin.x, self.frame.size.height - bottomView.frame.size.height, bottomView.frame.size.width, bottomView.frame.size.height);
    //If middleView was already added, we need to modify the contentInset of it
    if (self.middleView)
    {
        CGFloat offsetY = self.middleView.contentOffsetY;
        self.middleView.contentInsetBottom = bottomView.frame.size.height;
        if (!self.fixBottom && self.middleView.contentHeight > self.middleView.frame.size.height)
        {
            bottomView.frame = CGRectMake(bottomView.frame.origin.x, self.middleView.contentHeight - offsetY, bottomView.frame.size.width, bottomView.frame.size.height);
        }
    }
    
    if (_bottomView){
        [_bottomView removeFromSuperview];
    }
    _bottomView = bottomView;
    //Add bottomView to the bottom
    [self addSubview:_bottomView];
}

- (void)setRightView:(UIView *)rightView
{
    rightView.frame = CGRectMake(self.frame.size.width - rightView.frame.size.width, rightView.frame.origin.y, rightView.frame.size.width, rightView.frame.size.height);
    //If middleView was already added, we need to modify the contentInset of it
    if (self.middleView)
    {
        CGFloat offsetX = self.middleView.contentOffsetX;
        self.middleView.contentInsetRight = rightView.frame.size.width;
        if (!self.fixRight && self.middleView.contentWidth > self.middleView.frame.size.width)
        {
            rightView.frame = CGRectMake(self.middleView.contentWidth - offsetX, rightView.frame.origin.y, rightView.frame.size.width, rightView.frame.size.height);
        }
    }
    if (_rightView)
    {
        [_rightView removeFromSuperview];
    }
    _rightView = rightView;
    //Add rightView to the right
    [self addSubview:_rightView];
}

- (void)setMiddleView:(UIScrollView *)middleView
{
    UIEdgeInsets contentInset = UIEdgeInsetsMake(self.topView.frame.size.height, self.leftView.frame.size.width, self.bottomView.frame.size.height, self.rightView.frame.size.width);
    if (_middleView)
    {
        [_middleView removeFromSuperview];
    }
    _middleView = middleView;
    _middleView.frame = self.bounds;
    _middleView.contentInset = contentInset;
    [self addSubview:_middleView];
    //
    [self adjustSideViewsLocationForView:_middleView];
    
    if (self.topView) [self bringSubviewToFront:self.topView];
    if (self.leftView) [self bringSubviewToFront:self.leftView];
    if (self.bottomView) [self bringSubviewToFront:self.bottomView];
    if (self.rightView) [self bringSubviewToFront:self.rightView];
}

- (void)setFixTop:(BOOL)fixTop
{
    _fixTop = fixTop;
    
    if (self.topView)
    {
        if (_fixTop)
        {
            self.topView.frame = CGRectMake(self.topView.frame.origin.x, 0, self.topView.frame.size.width, self.topView.frame.size.height);
        }
        else{
            [self adjustTopViewLocationForView:self.middleView];
        }
    }
}

- (void)setFixLeft:(BOOL)fixLeft
{
    _fixLeft = fixLeft;
    
    if (self.leftView)
    {
        if (_fixLeft)
        {
            self.leftView.frame = CGRectMake(0, self.leftView.frame.origin.y, self.leftView.frame.size.width, self.leftView.frame.size.height);
        }
        else{
            [self adjustLeftViewLocationForView:self.middleView];
        }
    }
}

- (void)setFixBottom:(BOOL)fixBottom
{
    _fixBottom = fixBottom;
    
    if (self.bottomView)
    {
        if (_fixBottom || self.middleView.frame.size.height > self.middleView.contentHeight)
        {
            self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, self.frame.size.height - self.bottomView.frame.size.height, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
        }
        else{
            [self adjustBottomViewLocationForView:self.middleView];
        }
    }
}

- (void)setFixRight:(BOOL)fixRight
{
    _fixRight = fixRight;
    
    if (self.rightView)
    {
        if (_fixRight || self.middleView.frame.size.width > self.middleView.contentWidth)
        {
            self.rightView.frame = CGRectMake(self.frame.size.width - self.rightView.frame.size.width, self.rightView.frame.origin.y, self.rightView.frame.size.width, self.rightView.frame.size.height);
        }
        else{
            [self adjustRightViewLocationForView:self.middleView];
        }
    }
}

#pragma mark - public methods
- (void)adjustSideViewsLocationForView:(UIScrollView *)scrollView
{
    if (!scrollView) return;
    dispatch_async(dispatch_get_main_queue(), ^{
        scrollView.frame = self.bounds;
        if (self.topView)
        {
            if (self.fixTop)
            {
                self.topView.frame = CGRectMake(self.topView.frame.origin.x, 0, self.topView.frame.size.width, self.topView.frame.size.height);
            }
            else{
                [self adjustTopViewLocationForView:scrollView];
            }
        }
        if (self.leftView)
        {
            if (self.fixLeft)
            {
                self.leftView.frame = CGRectMake(0, self.leftView.frame.origin.y, self.leftView.frame.size.width, self.leftView.frame.size.height);
            }
            else{
                [self adjustLeftViewLocationForView:scrollView];
            }
        }
        if (self.bottomView)
        {
            if (self.fixBottom)
            {
                self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, self.frame.size.height - self.bottomView.frame.size.height, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
            }
            else{
                [self adjustBottomViewLocationForView:scrollView];
            }
        }
        if (self.rightView && !self.fixRight)
        {
            if (self.fixRight)
            {
                self.rightView.frame = CGRectMake(self.frame.size.width - self.rightView.frame.size.width, self.rightView.frame.origin.y, self.rightView.frame.size.width, self.rightView.frame.size.height);
            }
            else{
                [self adjustRightViewLocationForView:scrollView];
            }
        }
    });
}

#pragma mark - private methods
- (void)adjustTopViewLocationForView:(UIScrollView *)scrollView
{
    CGFloat y = 0;
    if (scrollView.contentOffsetY <= - self.topView.frame.size.height && self.topBounces)
    {
        y = fabs(scrollView.contentOffsetY) - self.topView.frame.size.height;
    }
    else if (!self.fixTop && scrollView.contentOffsetY > - self.topView.frame.size.height)
    {
        y = -scrollView.contentOffsetY - self.topView.frame.size.height;
    }
    self.topView.frame = CGRectMake(self.topView.frame.origin.x, y, self.topView.frame.size.width, self.topView.frame.size.height);
}

- (void)adjustLeftViewLocationForView:(UIScrollView *)scrollView
{
    CGFloat x = 0;
    if (scrollView.contentOffsetX <= - self.leftView.frame.size.width && self.leftBounces)
    {
        x = fabs(scrollView.contentOffsetX) - self.leftView.frame.size.width;
    }
    else if (!self.fixLeft && scrollView.contentOffsetX > - self.leftView.frame.size.width)
    {
        x = -self.leftView.frame.size.width - scrollView.contentOffsetX;
    }
    self.leftView.frame = CGRectMake(x, self.leftView.frame.origin.y, self.leftView.frame.size.width, self.leftView.frame.size.height);
}

- (void)adjustBottomViewLocationForView:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.frame.size.height - self.bottomView.frame.size.height;
    if (scrollView.contentHeight < scrollView.frame.size.height - self.bottomView.frame.size.height - self.topView.frame.size.height)
    {
        if (!self.fixBottomInside)
        {
            y = scrollView.contentHeight - scrollView.contentOffsetY;
        }
        else if (self.fixBottomInside && self.bottomBounces)
        {
            y = y - scrollView.contentOffsetY - self.topView.frame.size.height;
        }
    }
    else if ((scrollView.contentOffsetY > scrollView.contentHeight - scrollView.frame.size.height + self.bottomView.frame.size.height && self.bottomBounces) || (!self.fixBottom && scrollView.contentOffsetY <= scrollView.contentHeight - scrollView.frame.size.height + self.bottomView.frame.size.height))
    {
        y = scrollView.contentHeight - scrollView.contentOffsetY;
    }
    self.bottomView.frame = CGRectMake(self.bottomView.frame.origin.x, y, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
}

- (void)adjustRightViewLocationForView:(UIScrollView *)scrollView
{
    CGFloat x = scrollView.frame.size.width - self.rightView.frame.size.width;
    if (scrollView.contentWidth < scrollView.frame.size.width - self.rightView.frame.size.width - self.leftView.frame.size.width)
    {
        if (!self.fixRightInside)
        {
            x = scrollView.contentWidth - scrollView.contentOffsetX;
        }
        else if (self.fixRightInside && self.rightBounces)
        {
            x = x - scrollView.contentOffsetX - self.leftView.frame.size.width;
        }
    }
    else if ((scrollView.contentOffsetX > scrollView.contentWidth - scrollView.frame.size.width + self.rightView.frame.size.width && self.rightBounces) || (!self.fixRight && scrollView.contentOffsetX <= scrollView.contentWidth - scrollView.frame.size.width + self.rightView.frame.size.width))
    {
        x = scrollView.contentWidth - scrollView.contentOffsetX;
    }
    self.rightView.frame = CGRectMake(x, self.rightView.frame.origin.y, self.rightView.frame.size.width, self.rightView.frame.size.height);
}
@end
