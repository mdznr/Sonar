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
//  SRNoteViewCloseButtonCell.m
//  Sonar
//
//  Created by Matt on 7/28/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRNoteViewCloseButtonCell.h"

@implementation SRNoteViewCloseButtonCell

- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
	if ( [self isHighlighted] )
	{
		NSDrawThreePartImage(CGRectMake(0, 0, 12, 12),						//	NSRect frame
							 [NSImage imageNamed:@"crap"],					//	NSImage *startCap
							 [NSImage imageNamed:@"NoteCloseButtonHover"],	//	NSImage *centerFill
							 [NSImage imageNamed:@"crap"],					//	NSImage *endCap
							 NO,											//	BOOL vertical
							 NSCompositeSourceOver,							//	NSCompositingOperation op
							 1.0,											//	CGFloat alphaFraction
							 YES);											//	BOOL flipped
	}
	
	else
	{
		NSDrawThreePartImage(CGRectMake(0, 0, 12, 12),					//	NSRect frame
							 [NSImage imageNamed:@"crap"],				//	NSImage *startCap
							 [NSImage imageNamed:@"NoteCloseButton"],	//	NSImage *centerFill
							 [NSImage imageNamed:@"crap"],				//	NSImage *endCap
							 NO,										//	BOOL vertical
							 NSCompositeSourceOver,						//	NSCompositingOperation op
							 1.0,										//	CGFloat alphaFraction
							 YES);										//	BOOL flipped
	}
}

@end
