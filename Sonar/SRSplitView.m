//
//  SRSplitView.m
//  Sonar
//
//  Created by Matt on 8/5/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRSplitView.h"

@implementation SRSplitView

- (void)awakeFromNib
{
	[self restoreDefault];
}

- (void)restoreDefault
{
	id position = [[NSUserDefaults standardUserDefaults] objectForKey:@"SplitViewPosition"];
	
	if ( position )
	{
		[self setPosition:[position doubleValue] ofDividerAtIndex:0];
		[self adjustSubviews];
	}
}

- (void)saveDefault
{
	NSView *firstView = [[self subviews] objectAtIndex:0];
	[[NSUserDefaults standardUserDefaults] setDouble:firstView.frame.size.height forKey:@"SplitViewPosition"];
}

@end
