//
//  SiteWindowController.m
//  DangerTreeAssessment
//
//  Created by Abegael Jackson on 2015-06-22.
//  Copyright (c) 2015 Abbey Jackson & Alain Kahwaji. All rights reserved.
//

#import "SiteWindowController.h"

@interface SiteWindowController ()

@end

@implementation SiteWindowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *navigationController = [[UIStoryboard storyboardWithName:@"Review" bundle:nil] instantiateViewControllerWithIdentifier:@"SiteReviewNC"];
    [self addChildViewController:navigationController];
    [navigationController didMoveToParentViewController:self];
    navigationController.view.frame = self.view.bounds;
    [self.view addSubview:navigationController.view];
}

@end
