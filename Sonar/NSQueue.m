//
//  NSQueue.m
//  Sonar
//
//  Created by Matt on 9/1/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import "NSQueue.h"

@implementation NSQueue

- (id)pop
{
	//	if empty
	if ( [self count] == 0 ) {
		return nil;
	}
	
    id obj = self[0];
    if (obj != nil) {
        [self removeObjectAtIndex:0];
    }
    return obj;
}

- (void)push:(id)obj
{
    [self addObject:obj];
}

@end
