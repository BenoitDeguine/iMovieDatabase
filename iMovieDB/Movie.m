//
//  Movie.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "Movie.h"
#import <UIKit/UIKit.h>

@implementation Movie


- (id)initWithModel:(NSDictionary *)aModel {
    self = [super init];
    if (self) {
        NSLog(@"%@",aModel);
        self.id_movie = [aModel objectForKey:@"id"];
        self.title = [aModel objectForKey:@"title"];
        self.releaseDate = [aModel objectForKey:@"release_date"];
        self.imageUrl = [aModel objectForKey:@"poster_path"];
        self.overview = [aModel objectForKey:@"overview"];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)decoder // NSCoding deserialization
{
    if ((self = [super init])) {
        self.id_movie = [decoder decodeObjectForKey:@"id"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.releaseDate = [decoder decodeObjectForKey:@"releaseDate"];
        self.imageUrl = [decoder decodeObjectForKey:@"imageUrl"];
        self.overview = [decoder decodeObjectForKey:@"overview"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder // NSCoding serialization
{
    [encoder encodeObject:self.id_movie forKey:@"id"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.releaseDate forKey:@"releaseDate"];
    [encoder encodeObject:self.imageUrl forKey:@"imageUrl"];
    [encoder encodeObject:self.overview forKey:@"overview"];
}

-(UIImage *)ConvertStringToUIImage {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", @"https://image.tmdb.org/t/p/w185/", self.imageUrl]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [[UIImage alloc] initWithData:data];
}

@end
