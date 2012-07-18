//
//  SRAppDelegate.h
//  Sonar
//
//  Created by Matt on 6/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebView.h>

#import "SRPreferencesController.h"

@interface SRAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *mainWindow;
@property (assign) IBOutlet NSPanel *debugWindow;
@property (retain) SRPreferencesController *preferencesController;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (retain, nonatomic) NSWindowController *newIssue;

@property (strong) IBOutlet WebView *webView;

@property (weak) IBOutlet NSTextField *appleID;
@property (weak) IBOutlet NSTextField *password;

- (IBAction)showPreferences:(id)sender;
- (IBAction)showMainWindow:(id)sender;
- (IBAction)showDebugWindow:(id)sender;
- (IBAction)signIn:(id)sender;

- (IBAction)saveAction:(id)sender;

- (IBAction)createANewIssue:(id)sender;
- (IBAction)markAsResolved:(id)sender;
- (IBAction)appendMoreInformation:(id)sender;

@end
