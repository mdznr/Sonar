//
//  SRNoteViewCloseButtonCell.m
//  Sonar
//
//  Created by Matt on 7/28/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRNoteViewCloseButtonCell.h"

@implementation SRNoteViewCloseButtonCell

- (void)mouseEntered:(NSEvent *)event
{
	
}

- (void)mouseExited:(NSEvent *)event
{
	
}

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
