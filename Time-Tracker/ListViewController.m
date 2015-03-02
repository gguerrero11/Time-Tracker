//
//  ListViewController.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewDataSource.h"
#import "DetailViewController.h"
#import "ProjectController.h"


@interface ListViewController()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) ListTableViewDataSource *dataSource;
@property (nonatomic,strong) DetailViewController *dvc;
@property (nonatomic, strong) ProjectController *pController;

@end


#pragma mark custom init method for datasource

@implementation ListViewController

-(id)init{
    self = [super init];
    if (self){
        self.dataSource = [ListTableViewDataSource new];
        self.dvc = [DetailViewController new];
        self.pController = [ProjectController sharedInstance];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
    // Create "+" add button to create new project.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)add:(id)sender {
    [[ProjectController sharedInstance] addProject];
    self.dvc = [DetailViewController new];
    [self.dvc updateProjectProperty:[ProjectController sharedInstance].currentProject];
    [self.navigationController pushViewController:self.dvc animated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.dvc updateProjectProperty:self.pController.projectsArray[indexPath.row]];
    [self.dvc updateTextField];
    NSLog(@"%@", [self.pController.projectsArray[indexPath.row] projectName]);
    [self.navigationController pushViewController:self.dvc animated:YES];
}

@end
