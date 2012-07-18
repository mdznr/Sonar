//
//  SRPreferencesController.m
//  Sonar
//
//  Created by Matt on 7/3/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRPreferencesController.h"
#import "SRWebViewDelegate.h"

@interface SRPreferencesController ()

@end

@implementation SRPreferencesController
@synthesize appleID;
@synthesize password;
@synthesize signInButton;
@synthesize syncRate;

-(id)init
{
	if ( ![super initWithWindowNibName:@"Preferences"] ) {
		return nil;
	}
	
	return self;
}

- (void)windowDidLoad
{
	[super windowDidLoad];
	// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)signIn:(id)sender
{
	NSLog(@"Siging in via Preferences");
	NSNotification *trySignIn = [NSNotification notificationWithName:@"Try Signing In" object:[NSArray arrayWithObjects:appleID, password, nil]];
	// ***
}

- (IBAction)changeSyncRate:(id)sender
{
	
}

@end
