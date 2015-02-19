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

-(void)addProject:(Project*)project{
    NSMutableArray *mutableAddProjectsArray = [[NSMutableArray alloc]initWithArray:self.projectsArray];
    [mutableAddProjectsArray addObject:project];
    self.projectsArray = mutableAddProjectsArray;
}

-(void)removeProject:(Project*)project{
    NSMutableArray *mutableRemoveProjectsArray = [[NSMutableArray alloc]initWithArray:self.projectsArray];
    [mutableRemoveProjectsArray removeObject:project];
    self.projectsArray = mutableRemoveProjectsArray;
}


-(void)loadFromDefaults{
    NSArray *projectDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectListKey];
    NSMutableArray *projectMutableArray = [NSMutableArray new];
    for (NSDictionary *project in projectDictionaries){
        [projectMutableArray addObject:project]
    }
    
}

@end
