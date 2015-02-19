//
//  ListViewController.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewDataSource.h"


@interface ListViewController()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) ListTableViewDataSource *dataSource;

@end


#pragma mark custom init method for datasource

@implementation ListViewController

-(id)init{
    self = [super init];
    if (self){
        self.dataSource = [ListTableViewDataSource new];
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
      self.tableView.dataSource = self.dataSource;
}

@end
