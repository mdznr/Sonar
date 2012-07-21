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
	if ( [obj isEqualToString:@"Open"] )
	{
		NSAttributedString* as;
		NSTextAttachment* ta = [[NSTextAttachment alloc] init];
		NSTextAttachmentCell* tac = [[NSTextAttachmentCell alloc] init];
		[tac setImage:[NSImage imageNamed:@"unread"]];
		[ta setAttachmentCell: tac];
		as = [NSAttributedString attributedStringWithAttachment: ta];
		return as;
	}
	else if ( [obj isEqualToString:@"Insufficient Information"] )
	{
		return [[NSAttributedString alloc] initWithString:@"ii"];
	}
	else if ( [obj isEqualToString:@"Duplicate"] )
	{
		return [[NSAttributedString alloc] initWithString:@"d"];
	}
	else if ( [obj isEqualToString:@"3rd Party to Resolve"] )
	{
		return [[NSAttributedString alloc] initWithString:@"3"];
	}
	else if ( [obj isEqualToString:@"Behaves Correctly"] )
	{
		return [[NSAttributedString alloc] initWithString:@"bc"];
	}
	else if ( [obj isEqualToString:@"Closed"] )
	{
		return [[NSAttributedString alloc] initWithString:@"c"];
	}
   return [[NSAttributedString alloc] initWithString:@"boo"];
}

@end
