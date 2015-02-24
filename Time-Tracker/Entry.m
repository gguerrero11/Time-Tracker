//
//  Entry.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(id)initWithDictionary:(NSDictionary*)dictionary{
    self = [super init];
    if(self){

        self.timeIn = dictionary[timeInKey];
        self.timeOut = dictionary[timeOutkey];

    }
    return self;
}

-(NSDictionary *)entryDictionary {
    
    NSDictionary *entryDictionary = @{timeInKey: self.timeIn,
                                      timeOutkey: self.timeOut};
    return entryDictionary;
}

@end
