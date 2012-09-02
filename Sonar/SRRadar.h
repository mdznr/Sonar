/*
 
 Copyright (c) 2012 Matt Zanchelli.
 All rights reserved.
 
 Redistribution and use in source and binary forms are permitted
 provided that the above copyright notice and this paragraph are
 duplicated in all such forms and that any documentation,
 advertising materials, and other materials related to such
 distribution and use acknowledge that the software was developed
 by Matt Zanchelli.  The name of the University may not be used to
 endorse or promote products derived from this software without
 specific prior written permission.
 THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 
 */

//
//  SRRadar.h
//  Sonar
//
//  Created by Matt on 8/5/12.
//  Copyright (c) 2012 Matt Zanchelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SRRadar : NSManagedObject

@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * product;
@property (nonatomic, retain) NSString * build;
@property (nonatomic, retain) NSString * classification;
@property (nonatomic, retain) NSString * reproducibility;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSData * attachments;

@end
