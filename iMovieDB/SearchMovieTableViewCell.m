//
//  SearchMovieTableViewCell.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "SearchMovieTableViewCell.h"


@implementation SearchMovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

/*- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imgMovie.image = nil;
    NSLog(@"%@", self.myImage);
    NSString *imgURL = [NSString stringWithFormat:@"%@%@", @"https://image.tmdb.org/t/p/w185/", self.myImage];
    
    if ([[ImageManager sharedManager]imageAlreadyExist:imgURL]){
        self.imgMovie.image = [[ImageManager sharedManager] getImage:imgURL];
    } else {
        NSURL *productImageURL = [NSURL URLWithString:imgURL];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *task = [session dataTaskWithURL:productImageURL
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                NSLog(@"%@", imgURL);
                                                
                                                if ([response.URL isEqual:productImageURL]) {
                                                    
                                                    UIImage *img = [UIImage imageWithData:data];
                                                    
                                                    [[ImageManager sharedManager] saveImage:img imageName:imgURL];
                                                    
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        
                                                        self.imgMovie.image = img;
                                                        self.imgMovie.contentMode = UIViewContentModeScaleAspectFit;
                                                        
                                                        
                                                    });
                                                }
                                            }];
        
        [task resume];
    }
    
    
}*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

