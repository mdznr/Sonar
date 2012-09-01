//
//  NSQueue.h
//  Sonar
//
//  Created by Matt on 9/1/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSQueue : NSMutableArray

- (id)pop;
- (void)push:(id)obj;

@end
