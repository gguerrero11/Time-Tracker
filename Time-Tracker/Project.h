//
//  Project.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject
@property (nonatomic,strong)NSArray *entries;
@property (nonatomic, strong) NSString *projectName;


-(void)addEntry;
-(void)removeEntry;
@end
