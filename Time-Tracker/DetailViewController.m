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
#import "ProjectController.h"
#import <MessageUI/MFMailComposeViewController.h>


@interface DetailViewController () <UITextFieldDelegate, MFMailComposeViewControllerDelegate>


@property (nonatomic, strong) CustomEntryViewController *customEntryVC;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *entryTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkInButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkedOutButton;
@property (strong, nonatomic) DetailTableViewDataSource *dataSource;

@end

@implementation DetailViewController
//
//-(void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [self checkedOutChecker];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTextField];
    [self checkedOutChecker];
    
}

-(void)updateProjectProperty:(Project *)project
{
    self.project = project;
    self.project.checkInEnabled = project.checkInEnabled;
    self.project.projectName = project.projectName;
    self.dataSource = [DetailTableViewDataSource new];//alloc]initWithProject:self.project];
    self.dataSource.project = project;
    self.entryTableView.dataSource = self.dataSource;
    [self.entryTableView reloadData];
}

-(void)updateTextField {
    self.titleTextField.text = self.project.projectName;
}

#pragma mark UITextField delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text  isEqual: @""]) {
        textField.text = self.project.projectName;
    } else {
        self.project.projectName = textField.text;
    }
}


#pragma mark DetailView button's methods

- (IBAction)addCustomEntry:(id)sender {
    self.customEntryVC = [CustomEntryViewController new];
    [self.navigationController presentViewController:self.customEntryVC animated:YES completion:nil];
}

- (IBAction)checkInButton:(id)sender {
    
    [self.project startNewEntry];
    self.project.checkInEnabled = NO;
    [self checkedOutChecker];
    [self.entryTableView reloadData];
    
}

- (IBAction)checkOutButton:(id)sender {
    [self.project endCurrentEntry];
    self.project.checkInEnabled = YES;
    [self checkedOutChecker];
    [self.entryTableView reloadData];
    
}

- (void) checkedOutChecker {
    if (self.project.checkInEnabled == NO) {
        [self.checkInButton setEnabled:NO];
        [self.checkedOutButton setEnabled:YES];
    } else {
        [self.checkInButton setEnabled:YES];
        [self.checkedOutButton setEnabled:NO];
    }
}

#pragma mark Mail section

- (IBAction)reportButton:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [MFMailComposeViewController new];
        mailer.mailComposeDelegate = self;
        [self presentViewController:mailer animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0) {
    [self dismissViewControllerAnimated:YES completion:nil];
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
