//
//  DataManager.m
//  iMovieDB
//
//  Created by DEGUINE Benoît on 06/04/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "DataManager.h"
#import <YapDatabase/YapDatabase.h>
#import <YapDatabase/YapDatabaseView.h>
#import "Movie.h"

@implementation DataManager

- (NSString *)databasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *baseDir = ([paths count] > 0) ? paths[0] : NSTemporaryDirectory();
    
    NSString *databaseName = @"iMovieDatabase";
    
    return [baseDir stringByAppendingPathComponent:databaseName];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSString *databasePath = [self databasePath];
        
        self.database = [[YapDatabase alloc] initWithPath:databasePath];
        self.connexion = [self.database newConnection];
    }
    return self;
}


-(void)addMovie:(Movie *)myMovie {
    // On va chercher les anciens films
    NSMutableArray *movies = [self getMovies];

    [self.connexion readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        NSLog(@"%@", myMovie.id_movie);
        
        [transaction setObject:myMovie forKey:[NSString stringWithFormat:@"%@", myMovie.id_movie] inCollection:@"movie"];
    }];
    
    movies = [self getMovies];
}


-(NSMutableArray *)getMovies {
    __block NSMutableArray *movies = [[NSMutableArray alloc]init];

    [self.connexion readWithBlock:^(YapDatabaseReadTransaction *transaction) {

        [transaction enumerateRowsInCollection:@"movie"
                                    usingBlock:^(NSString *key, Movie *object, id metadata, BOOL *stop) {
                                        NSLog(@"%@", object.title);
              [movies addObject:object];
        }];

    }];
    
    return movies;
}

-(void)removeMovie:(Movie *)myMovie {
    
    [self.connexion readWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
        [transaction removeObjectForKey:[NSString stringWithFormat:@"%@", myMovie.id_movie] inCollection:@"movie"];
    }];

}
@end
