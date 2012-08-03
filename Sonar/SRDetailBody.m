//
//  SRDetailBody.m
//  Sonar
//
//  Created by Matt on 7/25/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRDetailBody.h"

@implementation SRDetailBody

-(NSSize)intrinsicContentSize
{
    if ( ![self.cell wraps] ) {
        return [super intrinsicContentSize];
    }
	
    NSRect frame = [self frame];
	
    CGFloat width = frame.size.width;
	
    // Make the frame very high, while keeping the width
    frame.size.height = CGFLOAT_MAX;
	
    // Calculate new height within the frame
    // with practically infinite height.
    CGFloat height = [self.cell cellSizeForBounds: frame].height;
	
    return NSMakeSize(width, height);
}

@end
