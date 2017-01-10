//
//  LZFixViewController.h
//  LZFixView
//
//  Created by zlh on 17/1/5.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZFixViewController : UIViewController
- (instancetype)initWithFixTop:(BOOL)fix;
- (instancetype)initWithFixBtm:(BOOL)fix;
- (instancetype)initWithFixLeft:(BOOL)fix;
- (instancetype)initWithFixRight:(BOOL)fix;
- (instancetype)initWithFixTop:(BOOL)fixTop AndFixBtm:(BOOL)fixBtm;
@end
