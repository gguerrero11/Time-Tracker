//
//  ListTableViewDataSource.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "ProjectController.h"

@implementation ListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [ProjectController sharedInstance].projectsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
//    ProjectController *projectControllerInstance = [ProjectController sharedInstance];
    NSArray *arrayOfProjects = [ProjectController sharedInstance].projectsArray[indexPath.row];
//    cell.textLabel.text = arrayOfProjects
    
    return cell;
}

@end
