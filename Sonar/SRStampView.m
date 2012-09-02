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
//  SRStampView.m
//  Sonar
//
//  Created by Matt on 7/26/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRStampView.h"

@implementation SRStampView

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
	NSString *stampName;
	
	if ( self.state == @"Resolved" ) 						stampName = @"StampResolved";
	else if ( self.state == @"Closed" ) 					stampName = @"StampClosed";
	else if ( self.state == @"3rd Party to Resolve" )		stampName = @"Stamp3rdPartyToResolve";
	else if ( self.state == @"Duplicate" ) 					stampName = @"StampDuplicate";
	else if ( self.state == @"Insufficient Information" )	stampName = @"StampInsufficientInformation";
	else if ( self.state == @"Behaves Correctly" )			stampName = @"StampBehavesCorrectly";
	else return;
	
	NSDrawThreePartImage([self bounds],						//	NSRect frame
						 [NSImage imageNamed:@""],			//	NSImage *startCap
						 [NSImage imageNamed:stampName],	//	NSImage *centerFill
						 [NSImage imageNamed:@""],			//	NSImage *endCap
						 NO,								//	BOOL vertical
						 NSCompositeSourceOver,				//	NSCompositingOperation op
						 1.0,								//	CGFloat alphaFraction
						 NO);								//	BOOL flipped
}

@end
