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
//  SRBackgroundView.m
//  Sonar
//
//  Created by Matt on 6/20/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRBackgroundView.h"

@implementation SRBackgroundView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
	[[NSColor colorWithCalibratedRed:234.0f/255.0f green:235.0f/255.0f blue:240.0f/255.0f alpha:1.0f] set];	// Light Blue
	[[NSColor colorWithCalibratedRed:0.93f green:0.93f blue:0.93f alpha:1.0f] set];	// Light Grey (Default)
    NSRectFill(dirtyRect);
}

@end
