//
//  SRNewProblemTitle.m
//  Sonar
//
//  Created by Matt on 7/13/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#define MAX_TITLE_LENGTH 80

#import "SRNewProblemTitle.h"

@implementation SRNewProblemTitle

- (NSString *)stringForObjectValue:(id)anObject
{
	return anObject;
}

- (BOOL)getObjectValue:(id *)anObject forString:(NSString *)string errorDescription:(NSString **)error;
{
    *anObject = string;
	return YES;
}

- (BOOL)isPartialStringValid:(NSString *)partialString newEditingString:(NSString **)newString errorDescription:(NSString **)error
{
	if ( partialString.length > MAX_TITLE_LENGTH ) {
		[[NSSound soundNamed:@"Funk"] play];
		*newString = [partialString substringToIndex:MAX_TITLE_LENGTH];
		return NO;
	}
	return YES;
}

@end
