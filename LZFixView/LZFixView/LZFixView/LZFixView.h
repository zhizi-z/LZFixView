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

//When relevant view is not nil, we need bellow bool values to decide whether relevant view can be scrolled with middleview
@property (assign, nonatomic)   BOOL    fixTop;
@property (assign, nonatomic)   BOOL    fixLeft;
@property (assign, nonatomic)   BOOL    fixBottom;
@property (assign, nonatomic)   BOOL    fixRight;

//@property (weak, nonatomic)     id      delegate;

/**
 *  Called every time contentOffset or contentSize changed (eg. you drag middleView, called in delegate method scrollViewDidScroll:)
 *
 *  @param scrollView - middleView
 */
- (void)adjustSideViewsLocationForView:(UIScrollView *)scrollView;
@end
