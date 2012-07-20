//
//  SRWebViewDelegate.m
//  Sonar
//
//  Created by Matt on 6/27/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRWebViewDelegate.h"

@implementation SRWebViewDelegate

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
	NSLog(@"Finished Loading: %@\n", [sender mainFrameURL]);
	
	// OpenRadar
	if ( [[sender mainFrameURL] hasPrefix:@"http://openradar.appspot.com"] ) {
		NSLog(@"Problem Title: %@",[sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('h3')[0].innerHTML"]);
		NSLog(@"Problem ID: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[1].getElementsByTagName('a')[1].innerHTML"]);
		NSLog(@"Originator: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[0].getElementsByTagName('td')[1].innerHTML"]);
		NSLog(@"Date Originated: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[1].getElementsByTagName('td')[3].innerHTML"]);
		NSLog(@"Status: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[2].getElementsByTagName('td')[1].innerHTML"]);
		NSLog(@"Product: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[3].getElementsByTagName('td')[1].innerHTML"]);
		NSLog(@"Classification: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[4].getElementsByTagName('td')[1].innerHTML"]);
		NSLog(@"Reproducible: %@", [sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('table')[0].getElementsByTagName('tr')[4].getElementsByTagName('td')[3].innerHTML"]);
	}
	
	// Bugreport.apple.com Sign In
	else if ( [[sender mainFrameURL] hasPrefix:@"https://bugreport.apple.com/cgi-bin/WebObjects/RadarWeb.woa/wa/signIn"])
	{
		// Apple ID:
		[sender stringByEvaluatingJavaScriptFromString:
			[NSString stringWithFormat:@"document.getElementsByName('theAccountName')[0].value = '%@'",
								[[NSUserDefaults standardUserDefaults] stringForKey:@"theAccountName"]]];
		
		// Password:
		[sender stringByEvaluatingJavaScriptFromString:
			[NSString stringWithFormat:@"document.getElementsByName('theAccountPW')[0].value = '%@'",
								[[NSUserDefaults standardUserDefaults] stringForKey:@"theAccountPW"]]];
		
		// Submit:
		[sender stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('appleConnectForm')[0].submit()"];
	}
	
	else if ( [[sender mainFrameURL] hasPrefix:@"https://bugreport.apple.com/cgi-bin/WebObjects/RadarWeb.woa/63/wo/zlj8oNIfnyjXU1uEYJBadM/4.17"])
	{
		NSLog(@"Finished!");
	}
	
	else {
		
	}
}

- (void)webView:(WebView *)sender resource:(id)identifier didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource
{
	
}

@end
