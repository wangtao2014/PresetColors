//
//  FontsViewController.m
//  PresetColors
//
//  Created by wangtao on 14-3-19.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import "FontsViewController.h"

@interface FontsViewController ()

@end

@implementation FontsViewController

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
    
    // You use font objects by passing them to methods that accept them as a parameter.
    // You do not create UIFont objects using the alloc and init methods. Instead, you use class methods of UIFont, such as preferredFontForTextStyle:, to look up and retrieve the desired font object. These methods check for an existing font object with the specified characteristics and return it if it exists. Otherwise, they create a new font object based on the desired font characteristics
    
    CGRect appRect = [UIScreen mainScreen].bounds;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, appRect.size.width, appRect.size.height)];
    
    NSArray *fontArray = [UIFont familyNames];
    
#define LABEL_HEIGHT 30.0f
    int i = 0;
    
    for (NSString *font in fontArray) {
        NSArray *familyArray = [UIFont fontNamesForFamilyName:font];
        // NSLog(@"familyArray=%@", familyArray);
        for (NSString *family in familyArray) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 40.0f + i * LABEL_HEIGHT, appRect.size.width - 20.0f, LABEL_HEIGHT)];
            label.text = family;
            label.font = [UIFont fontWithName:family size:16];
            [scrollView addSubview:label];
            i++;
        }
    }
    scrollView.contentSize = CGSizeMake(appRect.size.width, 60.0f + (i + 1) * LABEL_HEIGHT);
    
    // familyName fontName
    UIFont *fontT = [UIFont fontWithName:@"Thonburi-Bold" size:16];
    NSLog(@"familyName=%@", fontT.familyName);
    NSLog(@"fontName=%@", fontT.fontName);
    
    // pointSize(readonly) 字体大小
    NSLog(@"pointSize=%f", [fontT pointSize]);
    // ascender 字母的上半（或下半）出头部分
    NSLog(@"ascender=%f", [fontT ascender]);
    // descender
    NSLog(@"descender=%f", [fontT descender]);
    // lineHeight 字体高度
    NSLog(@"lineHeight=%f", [fontT lineHeight]);
    
    // capHeight 大写字母高度 10.451178
    NSLog(@"capHeight=%f", [fontT capHeight]);
    // x-Height 小写字母高度 7.520538
    NSLog(@"x-Height=%f", [fontT xHeight]);
    // fontDescriptor
    NSLog(@"fontDescriptor=%@", [fontT fontDescriptor].fontAttributes);
    // fontDescriptor={
    // NSFontNameAttribute = "Thonburi-Bold";
    // NSFontSizeAttribute = 16;
    // }
    /*
     NSString *const UIFontDescriptorFamilyAttribute;
     NSString *const UIFontDescriptorNameAttribute;
     NSString *const UIFontDescriptorFaceAttribute;
     NSString *const UIFontDescriptorSizeAttribute;
     NSString *const UIFontDescriptorVisibleNameAttribute;
     NSString *const UIFontDescriptorMatrixAttribute;
     NSString *const UIFontDescriptorCharacterSetAttribute;
     NSString *const UIFontDescriptorCascadeListAttribute;
     NSString *const UIFontDescriptorTraitsAttribute;
     NSString *const UIFontDescriptorFixedAdvanceAttribute;
     NSString *const UIFontDescriptorFeatureSettingsAttribute;
     NSString *const UIFontDescriptorTextStyleAttribute;
     */
    
    // labelFontSize 17
    NSLog(@"labelFontSize=%f", [UIFont labelFontSize]);
    // buttonFontSize 18
    NSLog(@"buttonFontSize=%f", [UIFont buttonFontSize]);
    // smallSystemFontSize 12
    NSLog(@"smallSystemFontSize=%f", [UIFont smallSystemFontSize]);
    // systemFontSize 14
    NSLog(@"systemFontSize=%f", [UIFont systemFontSize]);
    
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
