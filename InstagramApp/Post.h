//
//  Post.h
//  InstagramApp
//
//  Created by loneill on 16/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (weak, nonatomic) NSString *fullName;
@property (weak, nonatomic) NSString *profilePicture;
@property (weak, nonatomic) NSString *createdTime;
@property (weak, nonatomic) NSString *imageUrl;
@property (weak, nonatomic) NSString *captionText;
@property (weak, nonatomic) NSString *fromName;
@property (weak, nonatomic) NSString *fromPicture;

-(void) populateFromJSON: (NSMutableArray *)JSONResult;

@end

