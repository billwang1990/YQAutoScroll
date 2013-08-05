//
//  ViewController.m
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import "ViewController.h"
#import "YQAutoScroll.h"
#import "ImgModel.h"

@interface ViewController ()

@property (nonatomic) YQAutoScroll *YQScroll;

@end

@implementation ViewController

-(id)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    ImgModel *model1 = [[ImgModel alloc]initWithImage:@"image"];
    
    ImgModel *model2 = [[ImgModel alloc] initWithImage:@"image2"];
    
    ImgModel *model3 = [[ImgModel alloc] initWithImage:@"image3"];
    
    self.YQScroll = [[YQAutoScroll alloc]initWithFrame:CGRectMake(0, 380, self.view.bounds.size.width, self.view.bounds.size.height- 380) pageArray:[NSArray arrayWithObjects:model1, model2, model3, nil]];
    
    [self.view addSubview:self.YQScroll];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
