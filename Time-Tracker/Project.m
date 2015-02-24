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
    Entry *entry = [Entry new];
    NSLog(@"Logging: %@", [entry.timeStampsDic valueForKey:timeInKey]);
    
    self.currentEntry = entry;
    [self addEntry:entry];
}

-(void)endCurrentEntry {
    [self.currentEntry setValue:[NSDate date] forKey:timeOutkey];
}

-(void)addEntry:(Entry *) entry{
    if (!entry) {
        return;
    }
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
}

-(void)removeEntry{
    
}
@end
