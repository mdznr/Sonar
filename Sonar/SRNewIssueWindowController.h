//
//  SRNewIssueWindowController.h
//  Sonar
//
//  Created by Matt on 6/20/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SRNewIssueWindowController : NSWindowController

// Toolbar
@property (weak) IBOutlet NSToolbarItem *submitIcon;
@property (weak) IBOutlet NSToolbarItem *attachIcon;
@property (weak) IBOutlet NSToolbarItem *mediaIcon;
@property (weak) IBOutlet NSToolbarItem *configurationIcon;
@property (weak) IBOutlet NSToolbarItem *helpIcon;

// Properties
@property (weak) IBOutlet NSTextField *problemTitle;
@property (weak) IBOutlet NSPopUpButton *product;
@property (weak) IBOutlet NSComboBox *version;
@property (weak) IBOutlet NSPopUpButton *classification;
@property (weak) IBOutlet NSPopUpButton *reproducibility;
@property (unsafe_unretained) IBOutlet NSTextView *details;

- (IBAction)submitIssue:(id)sender;
- (IBAction)attach:(id)sender;
- (IBAction)attachBugshots:(id)sender;
- (IBAction)attachConfiguration:(id)sender;
- (IBAction)getHelp:(id)sender;
- (IBAction)print:(id)sender;

@end
