//
//  LZCheckButton.m
//  LZFixView
//
//  Created by zlh on 17/1/13.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import "LZCheckButton.h"

@implementation LZCheckButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImage *selImage = [UIImage imageNamed:@"lz_check_sel"];
        UIImage *norImage = [UIImage imageNamed:@"lz_check_nor"];
        [self setImage:selImage forState:UIControlStateSelected];
        [self setImage:norImage forState:UIControlStateNormal];
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, norImage.size.width + 20, norImage.size.height + 10);
        self.selected      = NO;
        
        [self addTarget:self action:@selector(didClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)didClicked
{
    self.selected = !self.selected;
    if ([self.delegate respondsToSelector:@selector(checkButtonDidClicked:)])
    {
        [self.delegate checkButtonDidClicked:self];
    }
}
@end
