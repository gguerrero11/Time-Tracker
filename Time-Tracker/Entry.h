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
@property (nonatomic, strong) NSArray *timeStampsDic;
@property (nonatomic, strong) NSString *timeIn;
@property (nonatomic, strong) NSString *timeOut;
@property (nonatomic, strong) NSString *totalTimeWorked;

@end
