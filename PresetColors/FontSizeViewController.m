//
//  FontSizeViewController.m
//  PresetColors
//
//  Created by wangtao on 14-3-19.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "FontSizeViewController.h"

@interface FontSizeViewController ()

@end

@implementation FontSizeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect appRect = [UIScreen mainScreen].bounds;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, appRect.size.width, appRect.size.height)];
    
    NSArray *array = @[@"10.0", @"12.0", @"14.0",@"15.0", @"16.0", @"17.0", @"18.0",@"19.0", @"20.0", @"22.0", @"24.0"];
#define LABEL_HEIGHT 30.0f
    
    int i = 0;
    
    for (NSString *item in array) {
        UILabel *fontSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 40.0f + i * LABEL_HEIGHT, 80.0f, LABEL_HEIGHT)];
        fontSizeLabel.text = [NSString stringWithFormat:@"%@号", item];
        fontSizeLabel.textAlignment = NSTextAlignmentLeft;
        [scrollView addSubview:fontSizeLabel];
        
        UILabel *fontLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 40.0f + i * LABEL_HEIGHT, 140.0f, LABEL_HEIGHT)];
        
        if ([item isEqualToString:@"12.0"]) {
            fontLabel.text = [NSString stringWithFormat:@"%@", @"SmallSystemFontSize"];
            fontLabel.textColor = [UIColor blueColor];
        } else if ([item isEqualToString:@"14.0"]) {
            fontLabel.text = [NSString stringWithFormat:@"%@", @"SystemFontSize"];
            fontLabel.textColor = [UIColor blueColor];
        } else if ([item isEqualToString:@"17.0"]) {
            fontLabel.text = [NSString stringWithFormat:@"%@", @"LabelFontSize"];
            fontLabel.textColor = [UIColor blueColor];
        } else if ([item isEqualToString:@"18.0"]) {
            fontLabel.text = [NSString stringWithFormat:@"%@", @"ButtonFontSize"];
            fontLabel.textColor = [UIColor blueColor];
        } else {
            fontLabel.text = [NSString stringWithFormat:@"%@", @"Hello World!"];
        }
        fontLabel.textAlignment = NSTextAlignmentLeft;
        fontLabel.font = [UIFont systemFontOfSize:[item floatValue]];
        [scrollView addSubview:fontLabel];
        
        UILabel *lineHeightLabel = [[UILabel alloc] initWithFrame:CGRectMake(230.0f, 40.0f + i * LABEL_HEIGHT, 80.0f, LABEL_HEIGHT)];
        lineHeightLabel.text = [NSString stringWithFormat:@"%.2fpt", [UIFont systemFontOfSize:[item floatValue]].lineHeight];
        lineHeightLabel.textAlignment = NSTextAlignmentLeft;
        [scrollView addSubview:lineHeightLabel];
        i++;
    }
    scrollView.contentSize = CGSizeMake(appRect.size.width, 60.0f + (i + 1) * LABEL_HEIGHT);
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
