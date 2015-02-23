//
//  ListTableViewDataSource.h
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface ListTableViewDataSource : UITableView <UITableViewDataSource,UITabBarDelegate>

@property (nonatomic, strong) Project *projectDataSource;

@end
