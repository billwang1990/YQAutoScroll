//
//  ImgView.h
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgModel.h"

@protocol YQPageViewDelegate <NSObject>

-(void)clickView : (int)tag;

@end

@interface YQPageView : UIView

@property (nonatomic, weak) id<YQPageViewDelegate> delegate;

-(id)initWithFrame:(CGRect)frame imgModel:(ImgModel *)model;

@end
