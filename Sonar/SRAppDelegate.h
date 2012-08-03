//
//  SRAppDelegate.h
//  Sonar
//
//  Created by Matt on 6/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>

#import "PrioritySplitViewDelegate.h"
#import "SRWebViewDelegate.h"
#import "SRNoteView.h"
#import "SRStampView.h"

@interface SRAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *mainWindow;
@property (assign) IBOutlet NSPanel *debugWindow;
@property (assign) IBOutlet NSWindow *preferencesWindow;
@property (assign) IBOutlet NSWindow *composeIssueWindow;

@property (retain) IBOutlet NSSplitView *splitView;
@property (retain) PrioritySplitViewDelegate *splitViewDelegate;
@property (strong) IBOutlet NSTableView *tableView;
@property (strong) IBOutlet NSView *detailView;

@property (strong) IBOutlet SRNoteView *noteView;
@property (strong) IBOutlet NSTextField *noteText;

@property (strong) IBOutlet NSScrollView *scrollView;
@property (strong) IBOutlet NSTextField *detailDate;
@property (strong) IBOutlet NSTextField *detailTitle;
@property (strong) IBOutlet NSTextField *detailState;
@property (strong) IBOutlet NSTextField *detailRank;
@property (strong) IBOutlet NSTextField *detailProduct;
@property (strong) IBOutlet NSTextField *detailBuild;
@property (strong) IBOutlet NSTextField *detailClassification;
@property (strong) IBOutlet NSTextField *detailReproducibility;
@property (strong) IBOutlet NSText *detailBody;
@property (strong) IBOutlet SRStampView *stampView;

@property (strong) NSSound *stampSound;

@property (retain) NSMutableDictionary *bug;
@property (retain) NSMutableArray *bugs;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong) IBOutlet WebView *webView;
@property (strong) IBOutlet SRWebViewDelegate *webViewDelegate;

@property (weak) IBOutlet NSTextField *appleID;
@property (weak) IBOutlet NSTextField *password;
@property (weak) IBOutlet NSButton *signInButton;

@property (weak) IBOutlet NSPopUpButton *syncRate;

// Compose Issue
// Toolbar
@property (weak) IBOutlet NSToolbarItem *submitIcon;
@property (weak) IBOutlet NSToolbarItem *mediaIcon;
@property (weak) IBOutlet NSToolbarItem *attachIcon;
@property (weak) IBOutlet NSToolbarItem *helpIcon;

// Properties
@property (weak) IBOutlet NSTextField *problemTitle;
@property (weak) IBOutlet NSPopUpButton *product;
@property (weak) IBOutlet NSComboBox *version;
@property (weak) IBOutlet NSPopUpButton *classification;
@property (weak) IBOutlet NSPopUpButton *reproducibility;
@property (strong) IBOutlet NSTextView *details;

- (IBAction)showMainWindow:(id)sender;
- (IBAction)showDebugWindow:(id)sender;
- (IBAction)signIn:(id)sender;

- (IBAction)saveAction:(id)sender;

- (IBAction)createANewIssue:(id)sender;
- (IBAction)markAsResolved:(id)sender;
- (IBAction)appendMoreInformation:(id)sender;

- (IBAction)closeNote:(id)sender;

- (IBAction)submitIssue:(id)sender;
- (IBAction)attachBugshots:(id)sender;
- (IBAction)attach:(id)sender;
- (IBAction)getHelp:(id)sender;
- (IBAction)print:(id)sender;

@end
