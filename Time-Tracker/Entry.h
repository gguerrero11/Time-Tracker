//
//  Entry.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const timeInKey = @"timeIn";
static NSString * const timeOutkey = @"timeOut";


@interface Entry : NSObject


@property (nonatomic, strong) NSDate *timeIn;
@property (nonatomic, strong) NSDate *timeOut;


-(id)initWithDictionary:(NSDictionary*)dictionary;

-(NSDictionary *)entryDictionary;

@end
