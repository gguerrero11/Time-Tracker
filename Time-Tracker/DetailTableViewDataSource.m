//
//  DetailTableViewDataSource.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailTableViewDataSource.h"
#import "Entry.h"

@implementation DetailTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.project.entries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Creating the cell
    UITableViewCell *cellForTimeStampList = [UITableViewCell new];
    NSArray *arrayOfEntriesInAProject = self.project.entries;
    NSDictionary *dictOfTimesInProject = arrayOfEntriesInAProject[indexPath.row];
    // Formatting the Date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE, MM-dd-yyyy, HH:mm"];
    NSDate *dt = [dictOfTimesInProject valueForKey:dayKey];
    NSString *dateAsString = [dateFormat stringFromDate:dt];
    // Outputs formatted date to textLabel of cell
    cellForTimeStampList.textLabel.text = dateAsString;

    return cellForTimeStampList;
}

@end
