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
