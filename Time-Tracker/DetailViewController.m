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

@property (nonatomic, strong) Project *currentProject;
@property (nonatomic, strong) CustomEntryViewController *customEntryVC;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *entryTableView;

@property (strong, nonatomic) DetailTableViewDataSource *dataSource;


@end

@implementation DetailViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.entryTableView reloadData];
}

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

-(void)updateTextField {
    self.titleTextField.text = self.project.projectName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.entryTableView.dataSource = self.dataSource;
}

#pragma mark UITextField delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text  isEqual: @""]) {
        NSString *defaultName = [NSString stringWithFormat:@"Project %ld",[ProjectController sharedInstance].projectsArray.count];
        self.project.projectName = defaultName;
        self.titleTextField.text = defaultName;
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
    [self.entryTableView reloadData];
    
}

- (IBAction)checkOutButton:(id)sender {
    [self.project endCurrentEntry];
    [self.entryTableView reloadData];
    
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
