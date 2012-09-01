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
#define kReproducibility @"reproducibility"
#define kDate @"date"
#define kNotes @"notes"
#define kDetails @"details"
#define kAttachments @"attachments"

@implementation SRAppDelegate

@synthesize stampView = _stampView;
@synthesize detailView = _detailView;
@synthesize noteText = _noteText;

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

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
	
	[_detailBody setVerticallyResizable:YES];
	
	// Set up custom Split View Delegate
	_splitViewDelegate = [[PrioritySplitViewDelegate alloc] init];

	[_splitViewDelegate setPriority:1 forViewAtIndex:0];
	[_splitViewDelegate setMinimumLength:96.0 forViewAtIndex:0];
	
	[_splitViewDelegate setPriority:0 forViewAtIndex:1];
	[_splitViewDelegate setMinimumLength:194.0 forViewAtIndex:1];
	
	[_splitView setDelegate:_splitViewDelegate];
	
	// Set up Table View
	self.bug = [NSMutableDictionary dictionaryWithObjectsAndKeys:
					@"Duplicate", kState,
					[NSNumber numberWithInt:3], kRank,
					[NSNumber numberWithInt:11898176], kID,
					@"Cannot remove Mail.app Unread Messages Badge", kTitle,
					@"Mail", kProduct,
					@"6.0 (1485)", kBuild,
					@"UI/Usability", kClassification,
					@"Always", kReproducibility,
					[NSDate date], kDate,
					@"This is a note", kNotes,
					@"Summary:\r\rSomething\r\rSteps to reproduce:\r\r1.\r2.\r3.\r", kDetails,
					[NSMutableArray arrayWithObjects: nil], kAttachments,
					nil];
	self.bugs = [NSMutableArray arrayWithObject:self.bug];
	
	NSMutableDictionary *bug3 = [NSMutableDictionary dictionaryWithDictionary:_bug];
	[bug3 setObject:@"Insufficient Information" forKey:kState];
	[self.bugs addObject:bug3];
	
	NSMutableDictionary *bug4 = [NSMutableDictionary dictionaryWithDictionary:_bug];
	[bug4 setObject:@"3rd Party to Resolve" forKey:kState];
	[self.bugs addObject:bug4];
	
	NSMutableDictionary *bug5 = [NSMutableDictionary dictionaryWithDictionary:_bug];
	[bug5 setObject:@"Behaves Correctly" forKey:kState];
	[self.bugs addObject:bug5];
	
	self.bug = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				@"Closed", kState,
				[NSNumber numberWithInt:1], kRank,
				[NSNumber numberWithInt:10934277], kID,
				@"This is a title", kTitle,
				@"Mac OS X", kProduct,
				@"10.8 (12A269)", kBuild,
				@"Security", kClassification,
				@"N/A", kReproducibility,
				[NSDate date], kDate,
				@"Another note goes here.", kNotes,
				@"Here are some\rdetails...", kDetails,
				[NSMutableArray arrayWithObjects: nil], kAttachments,
				nil];
	
	[self.bugs addObject:self.bug];
	
	self.bug = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				@"Open", kState,
				[NSNumber numberWithInt:2], kRank,
				[NSNumber numberWithInt:11905408], kID,
				@"NSEvent -mouseLocation returns invalid coordinate for Retina backing store", kTitle,
				@"Mac OS X", kProduct,
				@"10.7+", kBuild,
				@"Serious Issue", kClassification,
				@"Always", kReproducibility,
				[NSDate dateWithNaturalLanguageString:@"7/18/2012"], kDate,
				@"Here are some notes", kNotes,
				@"Summary:\r\rNSEvent's -mouseLocation method returns invalid coordinates for Retina backing store\r\rSteps to Reproduce:\r\r1) Obtain the current mouse location using [NSEvent mouseLocation]\r\r2) Align the mouse location to a screen's backing store using NSScreen's -backingAlignedRect:options:\r3) Convert the aligned mouse location to backing store coordinates with NSScreen's -convertRectToBacking:\r\rSee the attached CoordinateTester app as a sample.\r\rExpected Results:\r\rThe backing store coordinates should be valid.\r\rActual Results:\r\rThe backing store coordinates are invalid in the Y axis. On a 15\" Retina the range of values should be 0 to 1799 (1800 physical pixels), instead a range of 0 to 1800 pixels is reported (1801 pixels). Similarly, on non-Retina displays such as the 13\" MacBook Air, a range of values 0 to 900 is reported (901 pixels).\r\rRegression:\r\rIn prior releases of Mac OS X, the mouse location's Y axis was based at one, so a correct coordinate could be obtained by applying an offset. Values less than one are now returned (see Radar # 11905218)\r\rNotes:\r\rRunning the attached CoordinateTester app on several different systems shows these incorrect results are consistent:", kDetails,
				[NSMutableArray arrayWithObjects: nil], kAttachments,
				nil];
	
	[self.bugs addObject:self.bug];
	
	NSMutableDictionary *bug2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								 @"Open", kState,
								 [NSNumber numberWithInt:5], kRank,
								 [NSNumber numberWithInt:11913121], kID,
								 @"Enhance iTunes \"Some were not copied\" dialog", kTitle,
								 @"iTunes", kProduct,
								 @"10.6.3 (25)", kBuild,
								 @"Enhancment", kClassification,
								 @"Always", kReproducibility,
								 [NSDate dateWithNaturalLanguageString:@"19-Jul-2012 12:53 PM"], kDate,
								 @"", kNotes,
								 @"Summary:\rWhen a file moves from where iTunes expects to locate it, it does not sync the file and issues a warning dialog.\rThe warning dialog has a disclosure triangle that shows all entries.\r\rThese entries however are not copyable from the dialog. Further no more than one entry at a time is selectable from the dialog.\r\rIt would be greatly helpful if this list could be fully selected, copied, or exported to more easily handle correcting the problem.\r\rSteps to Reproduce:\rMove a directory of files in iTunes Library (Can be done by moving the library as a whole)\rSync to iDevice\rWarning dialog appears\r\rExpected Results:\rList can be selected as a whole and copied or exported\r\rActual Results:\rIndividual only items can be selected but not copied.\r\rRegression:\rEnhancement\r\rNotes:\rIf this info dumps to a log somewhere, the location alone would help me.\rAdditionally posted issue to Stack Exchange:\rhttp://apple.stackexchange.com/questions/56827/getting-the-whole-itunes-not-found-list", kDetails,
								 [NSMutableArray arrayWithObjects: nil], kAttachments,
								 nil];
	
	[self.bugs addObjectsFromArray:[NSArray arrayWithObjects:bug2, self.bug, bug2, self.bug, bug2, self.bug, nil]];
	
	[_tableView reloadData];
	[_tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:0] byExtendingSelection:NO];
	[self updateDetailViews];
	
	_stampSound = [NSSound soundNamed:@"stamp"];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
	if ( !flag ) {
		[_mainWindow makeKeyAndOrderFront:self];
		return YES;
	} else {
		return NO;
	}
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
	if ( [_debugWindow isKeyWindow] ) {
		[_debugWindow performClose:sender];
	}
	[_debugWindow makeKeyAndOrderFront:sender];
}

#pragma mark Preferences

- (void)controlTextDidChange:(NSNotification *)obj
{
	if ( obj.object == _appleID || obj.object == _password ) {
		if ( [_appleID stringValue].length && [_password stringValue].length) {
			[_signInButton setEnabled:YES];
		} else {
			[_signInButton setEnabled:NO];
		}
	}
	
	else if ( obj.object == _problemTitle ) {
		//	Used to update Window Title based on Problem Title
		NSString *title = [_problemTitle stringValue];
		if ( title.length )
		[_composeIssueWindow setTitle:title];
		else
		[_composeIssueWindow setTitle:@"New Issue"];
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
	[_composeIssueWindow makeKeyAndOrderFront:sender];
}

- (IBAction)markAsResolved:(id)sender
{
	[_stampSound play];
	[_bug setValue:@"Resolved" forKey:kState];
	[self updateDetailViews];
}

- (IBAction)appendMoreInformation:(id)sender
{
	
}

- (IBAction)closeNote:(NSButton *)sender
{
	[_bug setValue:@"" forKey:kNotes];
	[self updateDetailViews];
}

- (IBAction)addNote:(id)sender
{
	if ( [_bug objectForKey:kNotes] == nil || [[_bug objectForKey:kNotes] isEqualToString:@""] ) {
		[_bug setValue:@" " forKey:kNotes];
		[self updateDetailViews];
		[_noteText setStringValue:@""];
	}
	[_noteText becomeFirstResponder];
}

#pragma mark Updates to NSText

- (IBAction)updateNotes:(NSTextField *)sender
{
	[[_bugs objectAtIndex:[_tableView selectedRow]] setObject:[sender stringValue] forKey:kNotes];
	[_tableView reloadData];
}

#pragma mark Table View / Detail View

- (IBAction)showStateHeader:(NSButton *)sender
{
	if ( [sender state] == NSOnState )
	{

	}
	else
	{
		[_tableView addTableColumn:[[NSTableColumn alloc] initWithIdentifier:@"Attachments"]];
	}
}

- (void)updateDetailViews
{
	
	NSDateFormatter *dateFormatter =[[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"M/d/yy h:mm a"];
	[_detailDate setStringValue:[dateFormatter stringFromDate:[_bug objectForKey:kDate]]];
	
	[_detailTitle setStringValue:[_bug objectForKey:kTitle]];
	[_detailState setStringValue:[NSString stringWithFormat:@"State: %@", [_bug objectForKey:kState]]];
	[_detailRank setStringValue:[NSString stringWithFormat:@"Rank: %@", [_bug objectForKey:kRank]]];
	[_detailProduct setStringValue:[NSString stringWithFormat:@"Product: %@", [_bug objectForKey:kProduct]]];
	[_detailBuild setStringValue:[NSString stringWithFormat:@"Version: %@", [_bug objectForKey:kBuild]]];
	[_detailClassification setStringValue:[NSString stringWithFormat:@"Classification: %@", [_bug objectForKey:kClassification]]];
	[_detailReproducibility setStringValue:[NSString stringWithFormat:@"Reproducibility: %@", [_bug objectForKey:kReproducibility]]];
	
	[_noteText setStringValue:[_bug objectForKey:kNotes]];
	if ( [[_noteText stringValue] length] )
	{
		[_scrollView setFrame:CGRectMake(0, 0, _detailView.frame.size.width, _detailView.frame.size.height-_noteView.frame.size.height+1)];
		[_noteView setHidden:NO];
	}
	else
	{
		[_scrollView setFrame:CGRectMake(0, 0, _detailView.frame.size.width, _detailView.frame.size.height)];
		[_noteView setHidden:YES];
	}
	
	// Not sure if working ***
	[_scrollView setBounds:[_scrollView frame]];
	[_scrollView.subviews[0] setFrame:[_scrollView frame]];
	[_scrollView.subviews[0] setBounds:[_scrollView bounds]];
	//
	
	[_scrollView.subviews[0] setBackgroundColor:[NSColor whiteColor]];
	
	[_detailBody setString:[_bug objectForKey:kDetails]];
	[_detailBody sizeToFit]; // Does this work ***
	
	_stampView.state = [_bug objectForKey:kState];
	
	// Scroll to top ***
	
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
	}
}

#pragma mark Compose Issue Window methods

- (IBAction)submitIssue:(id)sender
{
	//	NSLog(@"Title: %@", [problemTitle stringValue]);
	//	NSLog(@"Product: %@", [product titleOfSelectedItem]);
	//	NSLog(@"Version/Build No.: %@", [version stringValue]);
	//	NSLog(@"Classification: %@", [classification titleOfSelectedItem]);
	//	NSLog(@"Reproducibility: %@", [reproducibility titleOfSelectedItem]);
	//	NSLog(@"Details:\n %@", [[details textStorage] string]);
	//	printf("\n");
	[_bugs insertObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
						 @"Open", kState,
//						 [NSNumber numberWithInt:nil], kRank,
//						 [NSNumber numberWithInt:nil], kID,
						 [_problemTitle stringValue], kTitle,
						 [_product titleOfSelectedItem], kProduct,
						 [_version stringValue], kBuild,
						 [_classification titleOfSelectedItem], kClassification,
						 [_reproducibility titleOfSelectedItem], kReproducibility,
						 [NSDate date], kDate,
						 @"", kNotes,
						 [[_details textStorage] string], kDetails,
						 [NSMutableArray arrayWithObjects: nil], kAttachments,
						 nil] atIndex:0];
	[_tableView reloadData];
	[_tableView selectRowIndexes:[[NSIndexSet alloc] initWithIndex:0] byExtendingSelection:NO];
	[self updateDetailViews];
	
	[_composeIssueWindow close];
}

- (IBAction)attach:(id)sender
{
	
}

- (IBAction)getHelp:(id)sender
{
	
}

- (IBAction)print:(id)sender
{
	
}

#pragma mark Application Termination

- (void)applicationWillTerminate:(NSNotification *)notification
{
	[_splitView saveDefault];
}

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