//
//  DCPageControl.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCPageControl.h"

@implementation DCPageControl

- (void)setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex ++) {
        UIImageView *subView = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 6;
        size.width = 6;
        [subView setFrame:CGRectMake(subView.frame.origin.x, subView.frame.origin.y, size.width, size.height)];
    };
}

@end
