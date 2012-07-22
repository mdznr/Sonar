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

@interface SRAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *mainWindow;
@property (assign) IBOutlet NSPanel *debugWindow;
@property (assign) IBOutlet NSWindow *preferencesWindow;

@property (retain) IBOutlet NSSplitView *splitView;
@property (retain) PrioritySplitViewDelegate *splitViewDelegate;
@property (strong) IBOutlet NSTableView *tableView;

@property (strong) IBOutlet NSTextView *textView;

@property (retain) NSMutableDictionary *bug;
@property (retain) NSMutableArray *bugs;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (retain, nonatomic) NSWindowController *newIssue;

@property (strong) IBOutlet WebView *webView;
@property (strong) IBOutlet SRWebViewDelegate *webViewDelegate;

@property (weak) IBOutlet NSTextField *appleID;
@property (weak) IBOutlet NSTextField *password;
@property (weak) IBOutlet NSButton *signInButton;

@property (weak) IBOutlet NSPopUpButton *syncRate;

- (IBAction)showMainWindow:(id)sender;
- (IBAction)showDebugWindow:(id)sender;
- (IBAction)signIn:(id)sender;

- (IBAction)saveAction:(id)sender;

- (IBAction)createANewIssue:(id)sender;
- (IBAction)markAsResolved:(id)sender;
- (IBAction)appendMoreInformation:(id)sender;

@end
