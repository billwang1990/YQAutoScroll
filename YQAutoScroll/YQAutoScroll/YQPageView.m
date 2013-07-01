//
//  ImgView.m
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import "YQPageView.h"

@implementation YQPageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame imgModel:(ImgModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
                
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [imageView setImage:model.image];
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPic)];

        [imageView addGestureRecognizer:tap];
        
        [self addSubview:imageView];
    }
    return self;
}

-(void)tapPic
{
    [self.delegate clickView:self.tag];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
