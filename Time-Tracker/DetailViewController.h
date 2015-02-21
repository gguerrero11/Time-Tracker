//
//  DetailViewController.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewDataSource.h"
#import "Project.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *entryTableView;
@property (strong, nonatomic) DetailTableViewDataSource *dataSource;
@property (strong, nonatomic) Project *project;

-(void)updateProjectProperty:(Project *)project;



@end
