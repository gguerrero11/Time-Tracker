//
//  ProjectController.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import "Entry.h"
#import "Stack.h"

@interface ProjectController : NSObject

@property (nonatomic, strong) NSArray *entriesArray;
@property (nonatomic, strong) NSArray *projectsArray;
@property (nonatomic, strong) NSString *projectName;

@property (nonatomic, strong) Project *currentProject;
@property (nonatomic, strong) Entry *currentEntry;

+(ProjectController*) sharedInstance;

-(Project *)addProject;
-(void)removeProject:(Project*)project;

-(void)startNewEntry;
-(void)endCurrentEntry;
-(void)addEntry:(Entry *)entry;
-(void)removeEntry;

@end
