//
//  APIManager.h
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface APIManager : NSObject

@property (nonatomic, strong) NSString *key;

-(BOOL)searchMovie:(NSString*) searchText answer:(void (^) (NSMutableArray *response))handler;
@end