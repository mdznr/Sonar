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
		
#warning Fix inability to paste long title and crop.
//		if ( partialString.length > MAX_TITLE_LENGTH + 1 )
//		{ // Occurs when pasting (doesn't work with paste length of MAX_TITLE_LENGTH, though)
//			*newString = [partialString substringToIndex:MAX_TITLE_LENGTH+1];	// Shouldn't be necessary when typing, but nice when pasting.
//		}
		
		return NO;
	}
	
	return YES;
}

@end
