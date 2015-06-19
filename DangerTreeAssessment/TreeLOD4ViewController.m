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
                                                    otherButtonTitles:@"Dangerous", @"Class 1 Trees = S", @"Class 2 Trees With No Structural Defects = S", @"Class 2 Cedars With Low Failure Potential = S", @"Class 3 Conifers With No Structural Defects = S", nil];
    
    [actionSheet showInView:self.view];
    
//    self.tree.rating = self.ratingField; ENUM
}
- (IBAction)saveTreeAssessmentButton:(id)sender {
    [self performSegueWithIdentifier:@"showTreeMgt" sender: self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showTreeMgt"]) {
        [[segue destinationViewController] setDetailItem:self.tree];
    }
}

@end
