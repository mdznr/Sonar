//
//  AppDelegate.m
//  Sonar
//
//  Created by Matt on 6/19/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRAppDelegate.h"

#define kState @"state"
#define kRank @"rank"
#define kID @"id"
#define kTitle @"title"
#define kProduct @"product"
#define kBuild @"build"
#define kClassification @"classification"
#define kDate @"date"
#define kNotes @"notes"
#define kDetails @"details"
#define kAttachments @"attachments"

@implementation SRAppDelegate

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

@synthesize splitView = _splitView;
@synthesize splitViewDelegate = _splitViewDelegate;
@synthesize tableView = _tableView;
@synthesize textView = _textView;

#pragma mark Synthesizing Windows
@synthesize debugWindow, preferencesWindow;

- (NSWindowController*)newIssue
{
	return _newIssue;
}

@synthesize webView = _webView;
@synthesize webViewDelegate = _webViewDelegate;

@synthesize appleID = _appleID;
@synthesize password = _password;
@synthesize signInButton = _signInButton;
@synthesize syncRate = _syncRate;

- (SRAppDelegate*)init
{
	self = [super init];
	if ( self )
	{
		NSAppleEventManager *appleEventManager = [NSAppleEventManager sharedAppleEventManager];
		[appleEventManager setEventHandler:self
							   andSelector:@selector(handleGetURLEvent:withReplyEvent:)
							 forEventClass:kInternetEventClass andEventID:kAEGetURL];
	}
	return self;
}

- (void)handleGetURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
	NSURL *url = [NSURL URLWithString:[[event paramDescriptorForKeyword:keyDirectObject] stringValue]];
	int radarID = [[[[url absoluteString] substringFromIndex:7] stringByReplacingOccurrencesOfString:@"problem/" withString:@""] intValue];
	NSString* something = [NSString stringWithFormat:@"http://openradar.appspot.com/%d", radarID];
	[_webView setMainFrameURL:something];
	NSLog(@"Opening: %@", something);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Set up custom Split View Delegate
	_splitViewDelegate = [[PrioritySplitViewDelegate alloc] init];

	[_splitViewDelegate setPriority:1 forViewAtIndex:0];
	[_splitViewDelegate setMinimumLength:92.0 forViewAtIndex:0];
	
	[_splitViewDelegate setPriority:0 forViewAtIndex:1];
	[_splitViewDelegate setMinimumLength:198.0 forViewAtIndex:1];
	
	[_splitView setDelegate:_splitViewDelegate];
	
	// Set up Table View
	self.bug = [NSMutableDictionary dictionaryWithObjectsAndKeys:
					@"Open", kState,
					[NSNumber numberWithInt:3], kRank,
					[NSNumber numberWithInt:11898176], kID,
					@"Cannot remove Mail.app Unread Messages Badge", kTitle,
					@"Mail", kProduct,
					@"6.0 (1485)", kBuild,
					@"UI/Usability", kClassification,
					[NSDate date], kDate,
					@"", kNotes,
					@"", kDetails,
					[NSMutableArray arrayWithObjects: nil], kAttachments,
					nil];
	self.bugs = [NSMutableArray arrayWithObject:self.bug];
	
	self.bug = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				@"Closed", kState,
				[NSNumber numberWithInt:1], kRank,
				[NSNumber numberWithInt:10934277], kID,
				@"This is a title", kTitle,
				@"Mac OS X", kProduct,
				@"10.8 (12A269)", kBuild,
				@"UI/Usability", kClassification,
				[NSDate date], kDate,
				@"", kNotes,
				@"", kDetails,
				[NSMutableArray arrayWithObjects: nil], kAttachments,
				nil];
	
	[self.bugs addObject:self.bug];
	[self.bugs addObjectsFromArray:[NSArray arrayWithObjects:self.bug, self.bug, self.bug, self.bug, nil]];
	
	[_tableView reloadData];
	[_tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:0] byExtendingSelection:NO];
	[self updateDetailViews];
}

// Returns the directory the application uses to store the Core Data store file. This code uses a directory named "com.mattzanchelli.Sonar" in the user's Application Support directory.
- (NSURL *)applicationFilesDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *appSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [appSupportURL URLByAppendingPathComponent:@"com.mattzanchelli.Sonar"];
}

// Creates if necessary and returns the managed object model for the application.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Sonar" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSManagedObjectModel *mom = [self managedObjectModel];
    if (!mom) {
        NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationFilesDirectory = [self applicationFilesDirectory];
    NSError *error = nil;
    
    NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    
    if (!properties) {
        BOOL ok = NO;
        if ([error code] == NSFileReadNoSuchFileError) {
            ok = [fileManager createDirectoryAtPath:[applicationFilesDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
        }
        if (!ok) {
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    } else {
        if (![[properties objectForKey:NSURLIsDirectoryKey] boolValue]) {
            // Customize and localize this error.
            NSString *failureDescription = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationFilesDirectory path]];
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:failureDescription forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:101 userInfo:dict];
            
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    
    NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent:@"Sonar.storedata"];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _persistentStoreCoordinator = coordinator;
    
    return _persistentStoreCoordinator;
}

// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) 
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"Failed to initialize the store" forKey:NSLocalizedDescriptionKey];
        [dict setValue:@"There was an error building up the data file." forKey:NSLocalizedFailureReasonErrorKey];
        NSError *error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];

    return _managedObjectContext;
}

// Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window
{
    return [[self managedObjectContext] undoManager];
}

#pragma mark Show/Hide Windows

- (IBAction)showMainWindow:(id)sender
{
	[_mainWindow makeKeyAndOrderFront:sender];
}

- (IBAction)showDebugWindow:(id)sender
{
	if ( [debugWindow isKeyWindow] ) {
		[debugWindow performClose:sender];
	}
	[debugWindow makeKeyAndOrderFront:sender];
}

#pragma mark Preferences

- (void)controlTextDidChange:(NSNotification *)obj
{
	if ( [_appleID stringValue].length && [_password stringValue].length)
	{
		[_signInButton setEnabled:YES];
	}
	else
	{
		[_signInButton setEnabled:NO];
	}
}

- (IBAction)signIn:(id)sender
{	
	NSString *storedVal = [_password stringValue];
	NSString *key = @"theAccountPW";
	
	[[NSUserDefaults standardUserDefaults] setObject:storedVal forKey:key];
	
	storedVal = [_appleID stringValue];
	key = @"theAccountName";
	
	[[NSUserDefaults standardUserDefaults] setObject:storedVal forKey:key];
	
	[[NSUserDefaults standardUserDefaults] synchronize]; // this method is optional
	
	[_webViewDelegate webView:_webView didSignInForUsername:[_password stringValue] andPassword:[_appleID stringValue]];
}

#pragma mark Toolbar Actions

// Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
- (IBAction)saveAction:(id)sender
{
    NSError *error = nil;
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    if (![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (IBAction)createANewIssue:(id)sender
{
	NSLog(@"New Issue");
	_newIssue = [[NSWindowController alloc] initWithWindowNibName:@"SRNewIssueWindowController"];
	[_newIssue showWindow:self];
}

- (IBAction)markAsResolved:(id)sender
{
	NSLog(@"Resolved");
}

- (IBAction)appendMoreInformation:(id)sender
{
	NSLog(@"Reply");
}

- (IBAction)addNote:(id)sender
{
	
}

#pragma mark Table View / Detail View

- (void)updateDetailViews {
	
	/*
	[nameView setStringValue:[villain objectForKey:kName]];
	[lastKnownLocationView setStringValue:[villain objectForKey:kLastKnownLocation]];
	[lastSeenDateView setDateValue:[villain objectForKey:kLastSeenDate]];
	if ([swornEnemyView indexOfItemWithObjectValue:[villain objectForKey:kSwornEnemy]]==NSNotFound) {
		[swornEnemyView addItemWithObjectValue:[villain objectForKey:kSwornEnemy]];
	}
	[swornEnemyView selectItemWithObjectValue:[villain objectForKey:kSwornEnemy]];
	[primaryMotivationView selectCellWithTag:[[[self class] motivations] indexOfObject:[villain objectForKey:kPrimaryMotivation]]];
	[powersView deselectAllCells];
	for (NSString *power in [[self class] powers]) {
		if ([[villain objectForKey:kPowers] containsObject:power]) {
			[powersView selectCellWithTag:[[[self class] powers] indexOfObject:power]];
		}
	}
	[evilnessView setIntegerValue:[[villain objectForKey:kEvilness] integerValue]];
	[powerSourceView setTitle:[villain objectForKey:kPowerSource]];
	[mugshotView setImage:[villain objectForKey:kMugshot]];
	[notesView setString:[villain objectForKey:kNotes]];
	 */
	
	[_textView setString:[_bug objectForKey:kTitle]];
}

#pragma mark NSTableView dataSource methods
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
	return [_bugs count];
}
- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
	return [[_bugs objectAtIndex:rowIndex] objectForKey:[aTableColumn identifier]];
}
- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
	[[_bugs objectAtIndex:rowIndex] setObject:anObject forKey:[aTableColumn identifier]];
	[self updateDetailViews];
}

#pragma mark NSTableview delegate methods
- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
	if ( [_tableView selectedRow] > -1 )
	{
		self.bug = [self.bugs objectAtIndex:[_tableView selectedRow]];
		[self updateDetailViews];
		NSLog(@"current villain properties: %@", _bug);
	}
}

#pragma mark Application Termination

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Save changes in the application's managed object context before the application terminates.
    
    if (!_managedObjectContext) {
        return NSTerminateNow;
    }
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (![[self managedObjectContext] hasChanges]) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {

        // Customize this code block to include application-specific recovery steps.              
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }

        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertAlternateReturn) {
            return NSTerminateCancel;
        }
    }

    return NSTerminateNow;
}

@end
