//
//  ViewController.m
//  LZFixView
//
//  Created by zlh on 17/1/5.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import "ViewController.h"
#import "LZFixViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didClickButton:(UIButton *)sender
{
    LZFixViewController *vc = nil;
    switch (sender.tag) {
        case 10:
            vc = [[LZFixViewController alloc] initWithFixLeft:YES];
            break;
        case 11:
            vc = [[LZFixViewController alloc] initWithFixLeft:NO];
            break;
        case 12:
            vc = [[LZFixViewController alloc] initWithFixRight:YES];
            break;
        case 13:
            vc = [[LZFixViewController alloc] initWithFixRight:NO];
            break;
        case 14:
            vc = [[LZFixViewController alloc] initWithFixTop:YES];
            break;
        case 15:
            vc = [[LZFixViewController alloc] initWithFixTop:NO];
            break;
        case 16:
            vc = [[LZFixViewController alloc] initWithFixBtm:YES];
            break;
        case 17:
            vc = [[LZFixViewController alloc] initWithFixBtm:NO];
            break;
        case 18:
            vc = [[LZFixViewController alloc] initWithFixTop:YES AndFixBtm:YES];
            break;
        case 19:
            vc = [[LZFixViewController alloc] initWithFixTop:NO AndFixBtm:NO];
            break;
        default:
            break;
    }
    if (vc)
    {
        vc.title = sender.titleLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
