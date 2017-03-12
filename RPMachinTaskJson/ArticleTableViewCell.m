//
//  ArticleTableViewCell.m
//  RPMachinTaskJson
//
//  Created by Student P_07 on 26/02/17.
//  Copyright © 2017 Rupali Pakale. All rights reserved.
//

#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)loaddata:(NSDictionary *)dict
{
    _lblAuthor.text=[dict valueForKey:@"author"];
    
    _lblDescription.text=[dict valueForKey:@"description"];
    
    dispatch_queue_t thread=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(thread, ^{
        NSString *urlToImage=[dict valueForKey:@"urlToImage"];
        NSData *imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlToImage]];
        UIImage *urlImage=[UIImage imageWithData:imageData];
        if(urlImage)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                _urlImageView.image=urlImage;
            });
        }
    });
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
