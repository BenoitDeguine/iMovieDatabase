//
//  Movie.h
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject <NSCoding>

@property (nonatomic, strong) NSString *id_movie;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *releaseDate;

- (id)initWithModel:(NSDictionary *)aModel;
-(UIImage *)ConvertStringToUIImage;

@end