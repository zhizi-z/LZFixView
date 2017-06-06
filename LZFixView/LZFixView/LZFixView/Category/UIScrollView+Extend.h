//
//  UIScrollView+Extend.h
//  LZFixViewExample
//
//  Created by zlh on 16/9/20.
//  Copyright © 2016年 zlh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  easy ways to get bellow properties
 */
@interface UIScrollView (Extend)
@property (assign, nonatomic)   CGFloat contentOffsetX;
@property (assign, nonatomic)   CGFloat contentOffsetY;
@property (assign, nonatomic)   CGFloat contentWidth;
@property (assign, nonatomic)   CGFloat contentHeight;
@property (assign, nonatomic)   CGFloat contentInsetTop;
@property (assign, nonatomic)   CGFloat contentInsetLeft;
@property (assign, nonatomic)   CGFloat contentInsetBottom;
@property (assign, nonatomic)   CGFloat contentInsetRight;
@end

