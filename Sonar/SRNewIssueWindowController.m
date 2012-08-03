//
//  SRNewIssueWindowController.m
//  Sonar
//
//  Created by Matt on 6/20/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRNewIssueWindowController.h"

@interface SRNewIssueWindowController ()

@end

@implementation SRNewIssueWindowController

- (void)controlTextDidChange:(NSNotification *)obj
{
//	Used to update Window Title based on Problem Title
	NSString *title = [_problemTitle stringValue];
	if ( title.length )
		[[self window] setTitle:title];
	else
		[[self window] setTitle:@"New Issue"];
}

@end
