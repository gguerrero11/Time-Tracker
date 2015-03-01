//
//  Project.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface Project : NSObject

@property (nonatomic,strong) NSMutableArray *entries;
@property (nonatomic, strong) NSString *projectName;
@property (nonatomic) NSInteger projectAtIndex;
@property (nonatomic) BOOL checkInEnabled;

-(void)startNewEntry;
-(void)endCurrentEntry;
-(void)addEntry:(Entry *)entry;
-(void)removeEntry;

@end
