//
//  ProjectController.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"

static NSString * const projectListKey= @"projectListKey";
@implementation ProjectController


+(ProjectController*)sharedInstance{
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
    });
    return sharedInstance;
}

#pragma mark Add Project CRUDs

// Everytime "projectsArray" is "called," it will be filled by the objects in the managedObjectContext by the fetcher
-(NSArray *)projectsArray {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Project"];
    NSArray *projectObjects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    return projectObjects;
}

-(Project *)addProject{
    self.currentProject = [NSEntityDescription insertNewObjectForEntityForName:@"Project"
                                                        inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    self.currentProject.projectName = [NSString stringWithFormat:@"Project %ld", self.projectsArray.count];
    [self save];
    return self.currentProject;
}

-(void)removeProject:(Project*)project{
    if (!project){
        return;
    }
//    NSMutableArray *mutableRemoveProjectsArray = [[NSMutableArray alloc]initWithArray:self.projectsArray];
//    [mutableRemoveProjectsArray removeObject:project];
//    self.projectsArray = mutableRemoveProjectsArray;
    [project.managedObjectContext deleteObject:project];
}

#pragma mark Add Entry CRUDs

-(NSArray *)entriesArray {
    return [self.currentProject.entries array];
}

-(void)startNewEntry {
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry"
                                                 inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    entry.timeIn = [NSDate date];
    self.currentEntry = entry;
    [self addEntry:entry];
}

-(void)addEntry:(Entry *) entry{
    if (!entry) {
        return;
    }
    NSMutableArray *entriesMutableArray = [[NSMutableArray alloc] initWithArray:[self.currentProject.entries array]];
    [entriesMutableArray addObject:entry];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:entriesMutableArray];
    self.currentProject.entries = orderedSet;
}

-(void)endCurrentEntry {
    self.currentEntry.timeOut = [NSDate date];
}


-(void)removeEntry{
    
}

#pragma mark Save method

-(void) save {
    [[Stack sharedInstance] save];
}



@end
