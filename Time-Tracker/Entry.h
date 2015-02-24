//
//  Entry.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString * const dayKey = @"dayKey";
static NSString * const timeInKey = @"timeIn";
static NSString * const timeOutkey = @"timeOut";
static NSString * const totalTimeWorkedKey = @"totalTimeWorked";

@interface Entry : NSObject

@property (nonatomic, strong) NSDate *day;
@property (nonatomic, strong) NSDate *timeIn;
@property (nonatomic, strong) NSDate *timeOut;
@property (nonatomic, strong) NSString *totalTimeWorked;

@property (nonatomic, strong) NSArray *timeStampsDic;

-(id)initWithDictionary:(NSDictionary*)dictionary;

-(void)addEntry:(Entry*)entry;

@end
