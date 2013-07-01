//
//  ImgModel.h
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImgModel : NSObject

@property (nonatomic, strong) UIImage *image;

- (id) initWithImage:(NSString*)imageText;


@end
