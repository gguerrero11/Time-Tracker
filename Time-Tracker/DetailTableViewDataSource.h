//
//  DetailTableViewDataSource.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface DetailTableViewDataSource : NSObject <UITableViewDataSource>
@property (nonatomic,strong) Project *project;


@end
