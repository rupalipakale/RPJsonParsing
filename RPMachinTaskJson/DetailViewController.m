//
//  DetailViewController.m
//  RPMachinTaskJson
//
//  Created by Student P_07 on 26/02/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Article Detail";
    [self loadData];
    
}

-(void)loadData
{
    self.lblAuthor.text=self.strAuthor;
    self.lblDescription.text=self.strDescription;
    self.urlImageView.image=self.urlImage;
}

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
