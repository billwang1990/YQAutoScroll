//
//  YQAutoScroll.h
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    rightDirection = 0,
    leftDirection
}ScrollDirection;

@protocol YQAutoScrollDelegate <NSObject>

-(void)clickImg:(NSInteger)img;

@end

@interface YQAutoScroll : UIView<UIScrollViewDelegate>
{
    NSTimer *timer;
    UIPageControl *pageControl;
    UIScrollView *scrollView;
    NSArray *imgArray;
    ScrollDirection direction;
    
    int pageNumber;
    int currentPage;
}

@property (nonatomic) NSMutableArray *images;
@property (nonatomic, weak) id<YQAutoScrollDelegate> delegate;


-(id)initWithFrame:(CGRect)frame pageArray:(NSArray*)pages;


@end
