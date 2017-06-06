//
//  LZCheckButton.h
//  LZFixView
//
//  Created by zlh on 17/1/13.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZCheckButton;
@protocol LZCheckButtonDelegate <NSObject>
- (void)checkButtonDidClicked:(UIButton *)checkButton;
@end

@interface LZCheckButton : UIButton
@property (nonatomic, weak) id delegate;
@end
