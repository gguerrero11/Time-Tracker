//
//  Project.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"
#import "Entry.h"

@interface Project ()

@property (nonatomic, strong) Entry *currentEntry;

@end

@implementation Project

-(void)startNewEntry {
    self.currentEntry = [[Entry alloc]initWithDictionary:[NSDictionary new]];
    [self.currentEntry setValue:[NSDate date] forKey:timeInKey];
    
}

-(void)endCurrentEntry {
    [self.currentEntry setValue:[NSDate date] forKey:timeOutkey];
}



-(void)addEntry{
    
}
-(void)removeEntry{
    
}
@end
