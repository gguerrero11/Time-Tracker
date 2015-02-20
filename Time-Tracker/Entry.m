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
        self.day = dictionary[dayKey];
        self.timeIn = dictionary[timeInKey];
        self.timeOut = dictionary[timeOutkey];
        self.totalTimeWorked = dictionary[totalTimeWorkedKey];
        
    }
    
    return 0;
}



-(void)addEntry:(Entry*)entry{
    NSMutableArray *mutableAddEntryArray = [[NSMutableArray alloc]initWithArray:self.timeStampsDic];
    [mutableAddEntryArray addObject:entry];
    self.timeStampsDic = mutableAddEntryArray;
}





@end
