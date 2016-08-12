//
//  APIManager.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "APIManager.h"
#import "ILMovieDBClient.h"

@implementation APIManager


-(BOOL)searchMovie:(NSString*) searchText answer:(void (^) (NSMutableArray *response))handler {
    NSMutableArray *moviesSearch = [[NSMutableArray alloc] init];
    
    [ILMovieDBClient sharedClient].apiKey = @"c8e7d97a54d836c20432f07a7bd218d2";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSDictionary *params = @{@"query": searchText};
        [[ILMovieDBClient sharedClient] GET:kILMovieDBSearchMovie parameters:params block:^(id responseObject, NSError *error) {
            
            if (!error) {
                //NSLog(@"%@", responseObject);
                NSDictionary *innerData = [responseObject objectForKey:@"results"];
                
                for (NSDictionary *setHostName in innerData) {
                    // NSString *title_movie = [setHostName objectForKey:@"title"];
                    
                    Movie *newMovie = [[Movie alloc] initWithModel:setHostName];
                    [moviesSearch addObject:newMovie];
                }
                
                 handler(moviesSearch);
            }
            
        }];
    });

    return YES;
    
}

@end
