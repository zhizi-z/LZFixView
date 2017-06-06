//
//  UIScrollView+Extend.m
//  LZFixViewExample
//
//  Created by zlh on 16/9/20.
//  Copyright © 2016年 zlh. All rights reserved.
//

#import "UIScrollView+Extend.h"

@implementation UIScrollView (Extend)
- (void)setContentOffsetX:(CGFloat)contentOffsetX
{
    self.contentOffset = CGPointMake(contentOffsetX, self.contentOffset.y);
}

- (CGFloat)contentOffsetX
{
    return self.contentOffset.x;
}

- (void)setContentOffsetY:(CGFloat)contentOffsetY
{
    self.contentOffset = CGPointMake(self.contentOffset.x, contentOffsetY);
}

- (CGFloat)contentOffsetY
{
    return self.contentOffset.y;
}

- (void)setContentWidth:(CGFloat)contentWidth
{
    self.contentSize = CGSizeMake(contentWidth, self.contentSize.height);
}

- (CGFloat)contentWidth
{
    return self.contentSize.width;
}

- (void)setContentHeight:(CGFloat)contentHeight
{
    self.contentSize = CGSizeMake(self.contentSize.width, contentHeight);
}

- (CGFloat)contentHeight
{
    return self.contentSize.height;
}

- (void)setContentInsetTop:(CGFloat)contentInsetTop
{
    self.contentInset = UIEdgeInsetsMake(contentInsetTop, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

- (CGFloat)contentInsetTop
{
    return self.contentInset.top;
}

- (void)setContentInsetLeft:(CGFloat)contentInsetLeft
{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, contentInsetLeft, self.contentInset.bottom, self.contentInset.right);
}

- (CGFloat)contentInsetLeft
{
    return self.contentInset.left;
}

- (void)setContentInsetBottom:(CGFloat)contentInsetBottom
{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, contentInsetBottom, self.contentInset.right);
}

- (CGFloat)contentInsetBottom
{
    return self.contentInset.bottom;
}

- (void)setContentInsetRight:(CGFloat)contentInsetRight
{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, contentInsetRight);
}

- (CGFloat)contentInsetRight
{
    return self.contentInset.right;
}
@end
