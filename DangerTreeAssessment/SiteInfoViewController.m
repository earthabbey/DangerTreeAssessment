//
//  SiteInfoViewController.m
//  DangerTreeAssessment
//
//  Created by Abegael Jackson on 2015-06-16.
//  Copyright (c) 2015 Abbey Jackson & Alain Kahwaji. All rights reserved.
//

#import "SiteInfoViewController.h"
#import "Site.h"

@interface SiteInfoViewController ()<UIActionSheetDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fireNumberField;
@property (weak, nonatomic) IBOutlet UITextField *dtaNameField;
@property (weak, nonatomic) IBOutlet UITextField *dtaUnitField;
@property (weak, nonatomic) IBOutlet UITextField *fuelField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *buiField;
@property (weak, nonatomic) IBOutlet UITextField *lodField;
@property (weak, nonatomic) IBOutlet UITextField *activityField;


@end

@implementation SiteInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextFields];
}

-(void)configureTextFields{
    self.locationField.delegate = self;
    self.buiField.delegate = self;
    self.activityField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma TextField Delegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.2 animations:^{
        if (textField == self.locationField || textField == self.buiField) {
            CGRect frameUp = self.view.frame;
            frameUp.origin.y -=120;
            self.view.frame = frameUp;
        }
        if (textField == self.activityField) {
            CGRect frameUp = self.view.frame;
            frameUp.origin.y -=240;
            self.view.frame = frameUp;
        }
    }];
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame = [[UIScreen mainScreen] bounds];
    }];
    
    [textField resignFirstResponder];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)lodActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Select Level Of Disturbance"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"LOD 1", @"LOD 2/3", @"LOD 4", nil];
    
    [actionSheet showInView:self.view];
}

- (IBAction)addNewTree:(id)sender {
}

-(Site*)createSite{
    Site *site = [[Site alloc]init];
    site.fireNumber = self.fireNumberField.text;
    site.dtaName = self.dtaNameField.text;
    site.dtaUnit = self.dtaUnitField.text;
//    site.fuel = self.fuelField.text;  ENUM
    site.location = self.locationField.text;
    site.bui = self.buiField.text;
//    site.lod = self.lodField.text;  ENUM
    site.activity = self.activityField.text;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:site];
    [realm commitWriteTransaction];
    
    return site;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showTreeInfo"]) {
        
        Site *site = [self createSite];
        [[segue destinationViewController] setDetailItem:site];
    }
    
}


- (IBAction)unwindToSiteInfo:(UIStoryboardSegue*)sender{
}


@end
