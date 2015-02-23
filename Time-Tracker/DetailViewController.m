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

@interface DetailViewController () <UITextFieldDelegate>



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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addCustomEntry:(id)sender {
}

- (IBAction)checkInButton:(id)sender {
}

- (IBAction)checkOutButton:(id)sender {
}

- (IBAction)reportButton:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{

    Project *project = [Project new];
    project.projectName = textField.text;

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
