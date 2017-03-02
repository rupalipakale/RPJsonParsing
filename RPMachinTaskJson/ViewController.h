//
//  ViewController.h
//  RPMachinTaskJson
//
//  Created by Student P_07 on 26/02/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *articleArray;
}

@property (strong, nonatomic) IBOutlet UITableView *articleTableView;
@property (strong, nonatomic) UIActivityIndicatorView *tableViewActivityIndicator;

@end

