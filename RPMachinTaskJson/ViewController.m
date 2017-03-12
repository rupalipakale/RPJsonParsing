//
//  ViewController.m
//  RPMachinTaskJson
//
//  Created by Student P_07 on 26/02/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import "ViewController.h"
#import "ArticleTableViewCell.h"
#import "DetailViewController.h"

#define KEY @"efe99de73d1d49608eb3d4e87c536b26"
#define BASE_PATH @"https://newsapi.org/v1/articles?"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"Articles List";
    [self showActivityIndicator];
    [self loadDataOnTableView];
}

-(void)showActivityIndicator
{
    self.tableViewActivityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.tableViewActivityIndicator.color=[UIColor blueColor];
    self.tableViewActivityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    self.tableViewActivityIndicator.center=self.view.center;
    [self.tableViewActivityIndicator startAnimating];
    [self.view addSubview:self.tableViewActivityIndicator];
}

-(void)loadDataOnTableView
{
    NSString *urlString=[NSString stringWithFormat:@"%@source=techcrunch&apiKey=%@",BASE_PATH,KEY];
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(response)
        {
          NSDictionary *responceDictionary=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",responceDictionary);
           articleArray=[responceDictionary valueForKey:@"articles"];
            dispatch_async(dispatch_get_main_queue(), ^{
                if([articleArray count])
                {
                    [_articleTableView reloadData];
                    [self.tableViewActivityIndicator stopAnimating];
                    [self.tableViewActivityIndicator setHidesWhenStopped:YES];
                    
                }
            });
           
        }
        else
        {
            [self showAlertwithTitle:@"Error" andMsg:error.localizedDescription];
            [self.tableViewActivityIndicator stopAnimating];
            [self.tableViewActivityIndicator setHidesWhenStopped:YES];
        }
    }];
    [dataTask resume];
}

//TableView Datasource Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return articleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ArticleCell"];
    if(cell==nil)
    {
        cell=[[ArticleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ArticleCell"];
    }
    [cell loaddata:[articleArray objectAtIndex:indexPath.row]];
    return cell;
}

//TableView Delegate method
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndex=indexPath;
    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"DetailSegue"])
    {
        DetailViewController *DetailVC=[segue destinationViewController];
        
        DetailVC.strAuthor=[[articleArray objectAtIndex:selectedIndex.row] valueForKey:@"author"];
        DetailVC.strDescription=[[articleArray objectAtIndex:selectedIndex.row] valueForKey:@"description"];
        DetailVC.strImage=[[articleArray objectAtIndex:selectedIndex.row] valueForKey:@"urlToImage"];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(void)showAlertwithTitle:(NSString *)title andMsg:(NSString *)message
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
