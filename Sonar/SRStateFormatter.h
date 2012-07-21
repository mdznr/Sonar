//
//  SRStateFormatter.h
//  Sonar
//
//  Created by Matt on 7/21/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRStateFormatter : NSFormatter

- (NSString *)stringForObjectValue:(id)obj;
- (BOOL)getObjectValue:(id)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (NSAttributedString *)attributedStringForObjectValue:(id)obj withDefaultAttributes:(NSDictionary *)attrs;

@end
