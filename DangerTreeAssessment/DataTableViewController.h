//
//  DataTableViewController.h
//  DangerTreeAssessment
//
//  Created by Abegael Jackson on 2015-06-16.
//  Copyright (c) 2015 Abbey Jackson & Alain Kahwaji. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Site.h"


@interface DataTableViewController : UITableViewController


@property (strong, nonatomic) RLMResults *sitesArray;


@end
