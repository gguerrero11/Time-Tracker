//
//  DetailViewController.m
//  Time-Tracker
//
//  Created by Gamaliel Tellez on 2/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewDataSource.h"
#import "Project.h"
#import "CustomEntryViewController.h"


@interface DetailViewController () <UITextFieldDelegate>

@property (nonatomic, strong) Project *currentProject;
@property (nonatomic, strong) CustomEntryViewController *customEntryVC;

@end

@implementation DetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [DetailTableViewDataSource new];
        
    }
    return self;
}

-(void)updateProjectProperty:(Project *)project
{
    self.project = project;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.entryTableView.dataSource = self.dataSource;
    self.project = self.dataSource.project;
    
}


#pragma mark DetailView button's methods

- (IBAction)addCustomEntry:(id)sender {
    self.customEntryVC = [CustomEntryViewController new];
    [self.navigationController presentViewController:self.customEntryVC animated:YES completion:nil];
}

- (IBAction)checkInButton:(id)sender {
    [self.currentProject startNewEntry];
    [self.entryTableView reloadData];
    
}

- (IBAction)checkOutButton:(id)sender {
    [self.currentProject endCurrentEntry];
    [self.entryTableView reloadData];
    
}

- (IBAction)reportButton:(id)sender {
}


#pragma mark UITextField delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    Project *project = [Project new];
    project.projectName = textField.text;
    
}


#pragma mark Misc methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
