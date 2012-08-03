//
//  SRNoteView.m
//  Sonar
//
//  Created by Matt on 7/24/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRNoteView.h"

@implementation SRNoteView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{

    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	NSDrawThreePartImage([self bounds],								//	NSRect frame
						 [NSImage imageNamed:@"NoteBackgroundCap"],	//	NSImage *startCap
						 [NSImage imageNamed:@"NoteBackgroundFill"],//	NSImage *centerFill
						 [NSImage imageNamed:@"NoteBackgroundCap"],	//	NSImage *endCap
						 NO,										//	BOOL vertical
						 NSCompositeSourceOver,						//	NSCompositingOperation op
						 1.0,										//	CGFloat alphaFraction
						 NO);										//	BOOL flipped
}

@end
