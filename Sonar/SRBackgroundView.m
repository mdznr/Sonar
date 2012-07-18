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
