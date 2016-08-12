//
//  DataManager.h
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YapDatabase/YapDatabase.h>
#import <YapDatabase/YapDatabaseView.h>
#import "Movie.h"

@interface DataManager : NSObject

@property (nonatomic, strong) YapDatabase *database;
@property (nonatomic, strong) YapDatabaseConnection *connexion;

-(void)addMovie:(Movie *)myMovie;
-(NSMutableArray *)getMovies;
-(void)removeMovie:(Movie *)myMovie;
@end
