//
//  ProjectController.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"
@interface ProjectController : NSObject
@property (nonatomic, strong) NSArray *projectsArray;

+(ProjectController*) sharedInstance;
-(void)addProject:(Project*)project;
-(void)removeProject:(Project*)project;

@end
