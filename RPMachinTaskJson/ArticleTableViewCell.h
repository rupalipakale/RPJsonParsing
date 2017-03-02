//
//  ArticleTableViewCell.h
//  RPMachinTaskJson
//
//  Created by Student P_07 on 26/02/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblAuthor;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UIImageView *urlImageView;

@end
