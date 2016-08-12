//
//  ImageManager.h
//  DataTransfer
//
//  Created by DEGUINE Benoît on 09/03/2016.
//  Copyright (c) 2016 DEGUINE Benoît. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageManager : NSObject

+(ImageManager *)sharedManager;

-(BOOL)imageAlreadyExist:(NSString *)imageName;
-(void)saveImage:(UIImage *)image imageName:(NSString *)imageName;
-(UIImage *)getImage:(NSString *)imageName;

@end
