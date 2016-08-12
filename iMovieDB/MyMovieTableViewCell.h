//
//  MyMovieTableViewCell.h
//  iMovieDB
//
//  Created by DEGUINE Benoît on 13/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleMovie;
@property (weak, nonatomic) IBOutlet UILabel *dateSortie;
@property (weak, nonatomic) IBOutlet UIImageView *imgMovie;
@property (strong, nonatomic) NSString *myImage;
@end
