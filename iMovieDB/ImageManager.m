//
//  ImageManager.m
//  DataTransfer
//
//  Created by DEGUINE Benoît on 09/03/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import "ImageManager.h"

@interface ImageManager () {
    NSString *_imageDirectory;
    
}


@end

@implementation ImageManager

+(ImageManager *)sharedManager{
    static dispatch_once_t onceToken;
    static ImageManager *__sharedManager = nil;
    
    
    dispatch_once(&onceToken, ^{
        __sharedManager = [ImageManager new];
    });
    
    return __sharedManager;
}

-(BOOL)imageAlreadyExist:(NSString *)imageName{
    
    NSString *imagePath = [[self imageDirectory] stringByAppendingString:[self base64Encode:imageName]];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:imagePath];
}

-(void)saveImage:(UIImage *)image imageName:(NSString *)imageName{
    
    NSString *imagePath = [[self imageDirectory] stringByAppendingString:[self base64Encode:imageName]];
    
    if (![self imageAlreadyExist:imageName]) {
        NSData *imageData = UIImagePNGRepresentation(image);
        [imageData writeToFile:imagePath atomically:NO];
    }
    
}

-(UIImage *)getImage:(NSString *)imageName{
    NSString *imagePath = [[self imageDirectory] stringByAppendingString:[self base64Encode:imageName]];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

-(NSString *)imageDirectory {
    if(!NSStringIsNullOrEmpty(_imageDirectory)) {
        return _imageDirectory;
    }
    _imageDirectory = [NSHomeDirectory() stringByAppendingString:@"/Documents/Images/"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:_imageDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:_imageDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    return _imageDirectory;
}

-(NSString *)base64Encode:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

@end
