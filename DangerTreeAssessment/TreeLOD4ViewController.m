//
//  TreeLOD4ViewController.m
//  DangerTreeAssessment
//
//  Created by Abegael Jackson on 2015-06-16.
//  Copyright (c) 2015 Abbey Jackson & Alain Kahwaji. All rights reserved.
//

#import "TreeLOD4ViewController.h"

@interface TreeLOD4ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *ratingField;

@end

@implementation TreeLOD4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextFields];
}

-(void)configureTextFields{
    [self textFieldShouldBeginEditing:self.ratingField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}
- (IBAction)ratingActionSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Select Rating"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles: kDangerous, kClass1, kClass2NoDefects, kClass2LowFailure, kClass3NoDefects, nil];
    
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        self.ratingField.text = kDangerous;
    }
    if (buttonIndex == 1) {
        self.ratingField.text = kClass1;
    }
    if (buttonIndex == 2) {
        self.ratingField.text = kClass2NoDefects;
    }
    if (buttonIndex == 1) {
        self.ratingField.text = kClass2LowFailure;
    }
    if (buttonIndex == 2) {
        self.ratingField.text = kClass3NoDefects;
    }
}

-(void)saveLOD4{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    self.tree.rating = self.ratingField.text;
    [realm commitWriteTransaction];
    
}

- (IBAction)saveTreeAssessmentButton:(id)sender {
    [self saveLOD4];
    [self performSegueWithIdentifier:@"showTreeMgt" sender: self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showTreeMgt"]) {
        [[segue destinationViewController] setTree:self.tree];
    }
}

@end
