//
//  ImgModel.m
//  YQAutoScroll
//
//  Created by niko on 13-7-1.
//  Copyright (c) 2013年 billwang. All rights reserved.
//

#import "ImgModel.h"

@implementation ImgModel


- (id) initWithImage:(NSString*)imageText {
    self = [super init];
    if(self != nil) {
        _image = [UIImage imageNamed:imageText];
    }
    return self;
}

@end
