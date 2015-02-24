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

-(id)init {
    self = [super init];
    self.entries = [NSMutableArray new];
    return self;
}

-(void)startNewEntry {
    Entry *entry = [Entry new];
    entry.timeIn = [NSDate date];
    self.currentEntry = entry;
    [self addEntry:entry];
}

-(void)endCurrentEntry {
    self.currentEntry.timeOut = [NSDate date];
}

-(void)addEntry:(Entry *) entry{
    if (!entry) {
        return;
    }
    [self.entries addObject:entry];
}

-(void)removeEntry{
    
}
@end
