//
//  MainViewController.m
//  PresetColors
//
//  Created by wangtao on 14-3-19.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "ColorsViewController.h"

@interface ColorsViewController ()

@end

@implementation ColorsViewController

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
    
    CGRect appRect = [[UIScreen mainScreen] bounds];
    NSLog(@"appRect=%@", NSStringFromCGRect(appRect));
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, appRect.size.width, appRect.size.height)];
    scrollView.contentSize = CGSizeMake(appRect.size.width, 2 * appRect.size.height);
    
    NSArray *keyArray = @[@"black",@"darkGray",@"lightGray",@"white",@"gray",@"red",@"green",@"blue",@"cyan",@"yellow",@"magenta",@"orange",@"purple",@"brown",@"clear", @"lightText", @"darkText", @"groupTableViewBackground", @"patternImage", @"HSL"];
    NSArray *valueArray = @[[UIColor blackColor], [UIColor darkGrayColor], [UIColor lightGrayColor], [UIColor whiteColor], [UIColor grayColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor brownColor], [UIColor clearColor], [UIColor lightTextColor], [UIColor darkTextColor], [UIColor groupTableViewBackgroundColor], [UIColor colorWithPatternImage:[UIImage imageNamed:@"Pattern"]], [UIColor colorWithHue:0.5f saturation:0.5f brightness:0.5f alpha:1.0f]];
    // Hue:色相 saturation:饱和度 brightness:亮度
    // UImage *image = [UIImage imageNamed:@"name.png"];
    // self.view.layer.contents = (id) image.CGImage; 使用此方法会节省内存
    // colorWithPatternImage 设置背景色会消耗较多内存
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:valueArray forKeys:keyArray];
    
#define HEIGHT 30.0f
    int i = 0;
    
    for (NSString *key in [dic allKeys]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f + i * HEIGHT, 80.0f, HEIGHT)];
        label.text = key;
        label.textAlignment = NSTextAlignmentLeft;
        [scrollView addSubview:label];
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(120.0f, 40.0f + i * HEIGHT, 160.0f, HEIGHT);
        layer.backgroundColor = ((UIColor *)[dic objectForKey:key]).CGColor;
        [scrollView.layer addSublayer:layer];
        i++;
    }
    // set(同时设置fill和stroke),setFill(填充), setStroke(边框)
    
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
