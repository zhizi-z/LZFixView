//
//  LZFixViewController.h
//  LZFixView
//
//  Created by zlh on 17/1/5.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZFixViewController : UIViewController
@property   (nonatomic, strong) NSArray     *aryValues;

@property   (nonatomic, assign) BOOL        fixTop;
@property   (nonatomic, assign) BOOL        fixLeft;
@property   (nonatomic, assign) BOOL        fixBtm;
@property   (nonatomic, assign) BOOL        fixRight;
@property   (nonatomic, assign) BOOL        fixInBtm;
@property   (nonatomic, assign) BOOL        fixInRight;

@property   (nonatomic, assign) BOOL        bounceTable;
@property   (nonatomic, assign) BOOL        bounceTop;
@property   (nonatomic, assign) BOOL        bounceLeft;
@property   (nonatomic, assign) BOOL        bounceBottom;
@property   (nonatomic, assign) BOOL        bounceRight;

@end
