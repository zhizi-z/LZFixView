//
//  StartViewController.m
//  LZFixView
//
//  Created by zlh on 17/1/13.
//  Copyright © 2017年 zlh. All rights reserved.
//

#import "StartViewController.h"
#import "DataViewController.h"
#import "LZFixViewController.h"
#import "LZCheckButton.h"

@interface StartViewController ()
@property (nonatomic, strong)   LZCheckButton *btnFixTop;
@property (nonatomic, strong)   LZCheckButton *btnFixLeft;
@property (nonatomic, strong)   LZCheckButton *btnFixBtm;
@property (nonatomic, strong)   LZCheckButton *btnFixRight;
@property (nonatomic, strong)   LZCheckButton *btnFixBtmInside;
@property (nonatomic, strong)   LZCheckButton *btnFixRightInside;

@property (nonatomic, strong)   LZCheckButton *btnMidBounce;
@property (nonatomic, strong)   LZCheckButton *btnTopBounce;
@property (nonatomic, strong)   LZCheckButton *btnLeftBounce;
@property (nonatomic, strong)   LZCheckButton *btnBtmBounce;
@property (nonatomic, strong)   LZCheckButton *btnRightBounce;

@property (nonatomic, strong)   NSMutableArray *selectedData;
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    
    self.selectedData = [[NSMutableArray alloc] init];
    
    UIButton *btnChooseData = [[UIButton alloc] initWithFrame:CGRectMake(25, 80, 120, 30)];
    [btnChooseData setTitle:@"去选择数据 >" forState:UIControlStateNormal];
    [btnChooseData setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnChooseData addTarget:self action:@selector(btnChooseData:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChooseData];
    
    self.btnFixTop = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 125, 0, 0)];
    self.btnFixTop.delegate = self;
    UILabel *lblFixTop = [[UILabel alloc] initWithFrame:CGRectMake(40,  125, 200, 30)];
    lblFixTop.text = @"顶部固定";
    [self.view addSubview:self.btnFixTop];
    [self.view addSubview:lblFixTop];
    
    self.btnFixLeft = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 155, 0, 0)];
    self.btnFixLeft.delegate = self;
    UILabel *lblFixLeft = [[UILabel alloc] initWithFrame:CGRectMake(40, 155, 200, 30)];
    lblFixLeft.text = @"左边固定";
    [self.view addSubview:self.btnFixLeft];
    [self.view addSubview:lblFixLeft];
    
    self.btnFixBtm = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 195, 0, 0)];
    self.btnFixBtm.delegate = self;
    UILabel *lblFixBtm = [[UILabel alloc] initWithFrame:CGRectMake(40, 195, 300, 30)];
    lblFixBtm.text = @"内容长度超出页面时，底部固定";
    [self.view addSubview:self.btnFixBtm];
    [self.view addSubview:lblFixBtm];
    
    self.btnFixRight = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 225, 0, 0)];
    self.btnFixRight.delegate = self;
    UILabel *lblFixRight = [[UILabel alloc] initWithFrame:CGRectMake(40, 225, 300, 30)];
    lblFixRight.text = @"内容宽度超出页面时，右边固定";
    [self.view addSubview:self.btnFixRight];
    [self.view addSubview:lblFixRight];
    
    self.btnFixBtmInside = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 265, 0, 0)];
    self.btnFixBtmInside.delegate = self;
    UILabel *lblFixBtmInside = [[UILabel alloc] initWithFrame:CGRectMake(40, 265, 300, 30)];
    lblFixBtmInside.text = @"内容长度很短时，底部固定";
    [self.view addSubview:self.btnFixBtmInside];
    [self.view addSubview:lblFixBtmInside];
    
    self.btnFixRightInside = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 295, 0, 0)];
    self.btnFixRightInside.delegate = self;
    UILabel *lblFixRightInside = [[UILabel alloc] initWithFrame:CGRectMake(40, 295, 300, 30)];
    lblFixRightInside.text = @"内容宽度很窄时，右边固定";
    [self.view addSubview:self.btnFixRightInside];
    [self.view addSubview:lblFixRightInside];
    
    self.btnMidBounce = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 335, 0, 0)];
    self.btnMidBounce.delegate = self;
    self.btnMidBounce.selected = YES;
    UILabel *lblMidBounce = [[UILabel alloc] initWithFrame:CGRectMake(40, 335, 300, 30)];
    lblMidBounce.text = @"开启TableView弹簧效果";
    [self.view addSubview:self.btnMidBounce];
    [self.view addSubview:lblMidBounce];
    
    self.btnTopBounce = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 365, 0, 0)];
    self.btnTopBounce.delegate = self;
    UILabel *lblTopBounce = [[UILabel alloc] initWithFrame:CGRectMake(40, 365, 300, 30)];
    lblTopBounce.text = @"开启TopView弹簧效果";
    [self.view addSubview:self.btnTopBounce];
    [self.view addSubview:lblTopBounce];
    
    self.btnLeftBounce = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 395, 0, 0)];
    self.btnLeftBounce.delegate = self;
    UILabel *lblLeftBounce = [[UILabel alloc] initWithFrame:CGRectMake(40, 395, 300, 30)];
    lblLeftBounce.text = @"开启LeftView弹簧效果";
    [self.view addSubview:self.btnLeftBounce];
    [self.view addSubview:lblLeftBounce];
    
    self.btnBtmBounce = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 425, 0, 0)];
    self.btnBtmBounce.delegate = self;
    UILabel *lblBtmBounce = [[UILabel alloc] initWithFrame:CGRectMake(40, 425, 300, 30)];
    lblBtmBounce.text = @"开启BottomView弹簧效果";
    [self.view addSubview:self.btnBtmBounce];
    [self.view addSubview:lblBtmBounce];
    
    self.btnRightBounce = [[LZCheckButton alloc] initWithFrame:CGRectMake(0, 455, 0, 0)];
    self.btnRightBounce.delegate = self;
    UILabel *lblRightBounce = [[UILabel alloc] initWithFrame:CGRectMake(40, 455, 300, 30)];
    lblRightBounce.text = @"开启RightView弹簧效果";
    [self.view addSubview:self.btnRightBounce];
    [self.view addSubview:lblRightBounce];
    
    UIButton *btnPreview = [[UIButton alloc] initWithFrame:CGRectMake(25, 505, [UIScreen mainScreen].bounds.size.width - 50, 44)];
    [btnPreview setTitle:@"效果预览" forState:UIControlStateNormal];
    [btnPreview addTarget:self action:@selector(btnPreview:) forControlEvents:UIControlEventTouchUpInside];
    [btnPreview setBackgroundColor:[UIColor magentaColor]];
    [self.view addSubview:btnPreview];
    
    UILabel *lblDescription = [[UILabel alloc] initWithFrame:CGRectMake(15, 550, [UIScreen mainScreen].bounds.size.width - 30, 100)];
    lblDescription.numberOfLines = 0;
    lblDescription.font = [UIFont systemFontOfSize:12.0];
    lblDescription.text = @"说明：一般情况下上下左右浮层view不可能同时添加，这里为了测试，上下左右的浮层view同时显示，会有互相覆盖的情况，请忽略；另外，\"内容宽度超出页面时，右边固定\"这条这里也看不出效果。";
    [self.view addSubview:lblDescription];
}

- (void)btnChooseData:(id)sender
{
    [self.selectedData removeAllObjects];
    DataViewController *vc = [[DataViewController alloc] init];
    vc.selectedData = self.selectedData;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btnPreview:(id)sender
{
    if (self.selectedData.count > 0)
    {
        LZFixViewController *fixVC = [[LZFixViewController alloc] init];
        fixVC.aryValues = [NSArray arrayWithArray:self.selectedData];
        fixVC.fixTop = self.btnFixTop.selected;
        fixVC.fixLeft = self.btnFixLeft.selected;
        fixVC.fixBtm = self.btnFixBtm.selected;
        fixVC.fixRight = self.btnFixRight.selected;
        fixVC.fixInBtm = self.btnFixBtmInside.selected;
        fixVC.fixInRight = self.btnFixRightInside.selected;
        fixVC.bounceTable = self.btnMidBounce.selected;
        fixVC.bounceTop = self.btnTopBounce.selected;
        fixVC.bounceLeft = self.btnLeftBounce.selected;
        fixVC.bounceBottom = self.btnBtmBounce.selected;
        fixVC.bounceRight = self.btnRightBounce.selected;
        [self.navigationController pushViewController:fixVC animated:YES];
    }
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请先选择数据！" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:NO completion:nil];
    }
}

#pragma mark - LZCheckButton delegate
- (void)checkButtonDidClicked:(UIButton *)checkButton
{
    if ([checkButton isEqual:self.btnMidBounce])
    {
        if (checkButton.selected)
        {
            self.btnTopBounce.enabled = YES;
            self.btnLeftBounce.enabled = YES;
            self.btnBtmBounce.enabled = YES;
            self.btnRightBounce.enabled = YES;
        }
        else {
            self.btnTopBounce.enabled = NO;
            self.btnLeftBounce.enabled = NO;
            self.btnBtmBounce.enabled = NO;
            self.btnRightBounce.enabled = NO;
        }
    }
}
@end
