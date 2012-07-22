//
//  SRStateFormatter.m
//  Sonar
//
//  Created by Matt on 7/21/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "SRStateFormatter.h"

@implementation SRStateFormatter

- (NSString *)stringForObjectValue:(id)obj
{
	return [[NSString alloc] init]; // This may not be a good idea?
}

- (BOOL)getObjectValue:(id)obj forString:(NSString *)string errorDescription:(NSString *)error
{	  
	if ( string == @"Open" )
	{
		obj = string;
		return YES;
	}
	else if ( string == @"Insufficient Information" )
	{
		obj = string;
		return YES;
	}
	else if ( string == @"Duplicate" )
	{
		obj = string;
		return YES;
	}
	else if ( string == @"3rd Party to Resolve" )
	{
		obj = string;
		return YES;
	}
	else if ( string == @"Behaves Correctly" )
	{
		obj = string;
		return YES;
	}
	else if ( string == @"Closed" )
	{
		obj = string;
		return YES;
	}
	
	return NO;
}

- (NSAttributedString *)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs
{
	NSAttributedString* as;
	NSTextAttachment* ta = [[NSTextAttachment alloc] init];
	NSTextAttachmentCell* tac = [[NSTextAttachmentCell alloc] init];
	
	if ( [obj isEqualToString:@"Open"] )
	{
		[tac setImage:[NSImage imageNamed:@"open"]];
	}
	else if ( [obj isEqualToString:@"Insufficient Information"] )
	{
		[tac setImage:[NSImage imageNamed:@"insufficientInformation"]];
	}
	else if ( [obj isEqualToString:@"Duplicate"] )
	{
		[tac setImage:[NSImage imageNamed:@"duplicate"]];
	}
	else if ( [obj isEqualToString:@"3rd Party to Resolve"] )
	{
		[tac setImage:[NSImage imageNamed:@"3rdParty"]];
	}
	else if ( [obj isEqualToString:@"Behaves Correctly"] )
	{
		[tac setImage:[NSImage imageNamed:@"behavesCorrectly"]];
	}
	else if ( [obj isEqualToString:@"Closed"] )
	{
		[tac setImage:[NSImage imageNamed:@"closed"]];
	}
	
	[ta setAttachmentCell: tac];
	as = [NSAttributedString attributedStringWithAttachment: ta];
	return as;
}

@end
