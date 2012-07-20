//
//  SRPreferencesController.h
//  Sonar
//
//  Created by Matt on 7/3/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SRPreferencesController : NSWindowController

@property (weak) IBOutlet NSTextField *appleID;
@property (weak) IBOutlet NSSecureTextField *password;
@property (weak) IBOutlet NSButton *signInButton;
@property (weak) IBOutlet NSPopUpButton *syncRate;

- (IBAction)signIn:(id)sender;
- (IBAction)changeSyncRate:(id)sender;

@end
