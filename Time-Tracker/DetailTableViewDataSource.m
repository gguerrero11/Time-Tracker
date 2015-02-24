//
//  DetailTableViewDataSource.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailTableViewDataSource.h"
#import "Entry.h"
#import "ProjectController.h"

@implementation DetailTableViewDataSource

-(id)initWithProject:(Project *)project {
    self = [super init];
    if (self) {
    self.project = project;
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.project.entries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    // Creating the cell
    UITableViewCell *cellForTimeStampList = [UITableViewCell new];
    NSArray *arrayOfEntriesInAProject = self.project.entries;
    Entry *entry = arrayOfEntriesInAProject[indexPath.row];
 
    // Formatting the Date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE, MM-dd-yyyy, HH:mm"];
    NSString *dateAsString = [dateFormat stringFromDate:entry.timeIn];
 
    // Outputs formatted date to textLabel of cell
    // cellForTimeStampList.textLabel.text = dateAsString;
    cellForTimeStampList.textLabel.text = @"Test";
    
    return cellForTimeStampList;
}

@end
