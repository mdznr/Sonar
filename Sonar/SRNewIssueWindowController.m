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

@synthesize submitIcon;
@synthesize attachIcon;
@synthesize mediaIcon;
@synthesize configurationIcon;
@synthesize helpIcon;
@synthesize problemTitle;
@synthesize product;
@synthesize version;
@synthesize classification;
@synthesize reproducibility;
@synthesize details;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)awakeFromNib
{
	
}

// Used to update Window Title based on Problem Title
- (void)controlTextDidChange:(NSNotification *)obj
{
	NSString *title = [problemTitle stringValue];
	if ( title.length )
		[[self window] setTitle:title];
	else
		[[self window] setTitle:@"New Issue"];
}

- (IBAction)submitIssue:(id)sender
{
	NSLog(@"Title: %@", [problemTitle stringValue]);
	NSLog(@"Product: %@", [product titleOfSelectedItem]);
	NSLog(@"Version/Build No.: %@", [version stringValue]);
	NSLog(@"Classification: %@", [classification titleOfSelectedItem]);
	NSLog(@"Reproducibility: %@", [reproducibility titleOfSelectedItem]);
	NSLog(@"Details:\n %@", [[details textStorage] string]);
	printf("\n");
}

- (IBAction)attach:(id)sender
{
	
}

- (IBAction)attachBugshots:(id)sender
{
	
}

- (IBAction)attachConfiguration:(id)sender
{
	
}

- (IBAction)getHelp:(id)sender
{
	
}

- (IBAction)print:(id)sender
{
	
}

@end
