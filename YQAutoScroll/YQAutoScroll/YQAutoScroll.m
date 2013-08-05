//
//  YQAutoScroll.m
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import "YQAutoScroll.h"
#import "YQPageView.h"

@interface YQAutoScroll ()<YQPageViewDelegate>
{
    CGFloat width;
}

@end

@implementation YQAutoScroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame pageArray:(NSArray *)pages
{
    self = [super initWithFrame:frame];
    if(self)
    {
        width = frame.size.width;
        pageNumber = pages.count;

        currentPage = 0;
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.pagingEnabled = YES;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.delegate = self;
        scrollView.userInteractionEnabled = YES;
        
        CGSize newSize = CGSizeMake(width * pageNumber,  scrollView.frame.size.height);
        [scrollView setContentSize:newSize];
        
        [self addSubview:scrollView];
        
        pageControl = [[UIPageControl alloc]init];
        
        pageControl.numberOfPages = pages.count;
        [pageControl sizeToFit];
        
        [pageControl setCenter:CGPointMake(frame.size.width/2.0, frame.size.height - 20)];
        [self addSubview:pageControl];
        
        imgArray = pages;
        
        [imgArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            YQPageView *view = [[YQPageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) imgModel:obj];
            
            view.delegate = self;
            
            view.tag = idx;
            view.frame = CGRectOffset(view.frame, idx*frame.size.width, 0);
            [scrollView addSubview:view];
        }];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
        
    }
    return self;    
}

-(void)changeView
{
    if(currentPage == 0)
        direction = rightDirection;
    else if (currentPage == pageNumber - 1)
    {
        direction = leftDirection;
    }
    
    if (direction == rightDirection) {
        currentPage++;
    }else if (direction == leftDirection)
    {
        currentPage--;
    }
    
    pageControl.currentPage = currentPage;
    
    [scrollView setContentOffset:CGPointMake(width*currentPage, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scroll {
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scroll {

    currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
#ifdef DEBUG
    NSLog(@"currentPage %d", currentPage);
#endif
    
    pageControl.currentPage = currentPage;
}

#pragma mark YQPageViewDelegate
-(void)clickView:(int)tag
{
    if ([self.delegate respondsToSelector:@selector(clickImg:)]) {
        [self.delegate clickImg:tag];
        NSLog(@"click photo at index : %d",tag);
    }
    NSLog(@"click photo at index : %d",tag);

}


@end
