/*
 
 Copyright (c) 2012 Matt Zanchelli.
 All rights reserved.
 
 Redistribution and use in source and binary forms are permitted
 provided that the above copyright notice and this paragraph are
 duplicated in all such forms and that any documentation,
 advertising materials, and other materials related to such
 distribution and use acknowledge that the software was developed
 by Matt Zanchelli.  The name of the University may not be used to
 endorse or promote products derived from this software without
 specific prior written permission.
 THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 
 */

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
