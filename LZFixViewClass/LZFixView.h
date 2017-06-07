//
//  LZFixView.h
//  LZFixViewExample
//
//  Created by zlh on 16/9/9.
//  Copyright © 2016年 zlh. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  At least, every view can be composed of five subviews (top, left, bottom, right, middle). Normally when middleView is the instance of UIScrollView or subClass of UIScrollView, we hope that top (or left, bottom, right) view can scroll as middleView scrolls, but if the content size of middleView is smaller than its frame, we hope side views can be set as fixed or not.
 *  This class is created to fulfill previous reqirement.
 */
@interface LZFixView : UIView
@property (strong, nonatomic)   UIView *topView;
@property (strong, nonatomic)   UIView *leftView;
@property (strong, nonatomic)   UIView *bottomView;
@property (strong, nonatomic)   UIView *rightView;
//Normally middleView is instance of UIScrollView or sub class of it.
@property (strong, nonatomic)   UIScrollView *middleView;

// default value is NO; When relevant view is not nil, we need bellow bool values to decide whether relevant view can be scrolled with middleview(当页面内容超出页面范围时，这四个属性可以设置四边view是跟在跟随内容滚动，还是固定在四边）
@property (assign, nonatomic)   BOOL    fixTop;
@property (assign, nonatomic)   BOOL    fixLeft;
@property (assign, nonatomic)   BOOL    fixBottom;
@property (assign, nonatomic)   BOOL    fixRight;
// default value is NO; When contentHeight of midView is much smaller than its frameHeight, we need bellow two properties to decide bottom view and right view to show just under content or on the bottom and th right(当页面内容很短或是很窄时，这两个属性可以设置底部和右边view是跟在内容后面，还是固定在最底部；当然考虑到内容是从上往下，从左往右显示，所以顶部和左边就不考虑这种情况了）
@property (assign, nonatomic)   BOOL    fixBottomInside;
@property (assign, nonatomic)   BOOL    fixRightInside;

// default value is NO; Only works when middleView.bounces = YES;(当middleView的bounces被设为YES后，可以改变以下属性来分别决定四边view是否跟随middleView一起拉伸反弹）
@property (assign, nonatomic)   BOOL    topBounces;
@property (assign, nonatomic)   BOOL    leftBounces;
@property (assign, nonatomic)   BOOL    bottomBounces;
@property (assign, nonatomic)   BOOL    rightBounces;

//@property (weak, nonatomic)     id      delegate;

/**
 *  Called every time contentOffset or contentSize changed (eg. you drag middleView, called in delegate method scrollViewDidScroll:)
 *
 *  @param scrollView - middleView
 */
- (void)adjustSideViewsLocationForView:(UIScrollView *)scrollView;
@end
