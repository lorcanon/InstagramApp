//
//  Post.m
//  InstagramApp
//
//  Created by loneill on 16/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import "Post.h"

@implementation Post

-(void) populateFromJSON: (NSMutableArray *)JSONResult
{
   // NSMutableArray *post = [JSONResult valueForKey:@"data"];
    NSMutableArray *user = [JSONResult valueForKey:@"user"];
    _fullName = [user valueForKey:@"full_name"];
    _profilePicture = [user valueForKey:@"profile_picture"];
    NSMutableArray *images = [JSONResult valueForKey:@"images"];
    NSMutableArray *stdResImage = [images valueForKey:@"standard_resolution"];
    _imageUrl = [stdResImage valueForKey:@"url"];
    _createdTime = [JSONResult valueForKey:@"created_time"];
    NSMutableArray *caption = [JSONResult valueForKey:@"caption"];
    _captionText = [caption valueForKey:@"text"];
    NSMutableArray *from = [caption valueForKey:@"from"];
    _fromName = [from valueForKey:@"full_name"];
    _fromPicture = [from valueForKey:@"profile_picture"];

    
}


@end

/*
 data [{1.....user{2...full_name,,,,,profile_picture....2}, images{2.....standard_resolution{3...url3}2}, created_time, caption{2...text......from{3....full_name...profile_picture...3}2}...1}, {repeat above1....user{2..............2}1}
 @property (weak, nonatomic) NSString *fullName;xx
 @property (weak, nonatomic) NSString *profilePicture;xx
 @property (weak, nonatomic) NSString *createdTime;xx
 @property (weak, nonatomic) NSString *imageUrl;xx
 @property (weak, nonatomic) NSString *captionText;xx
 @property (weak, nonatomic) NSString *fromName;xx
 @property (weak, nonatomic) NSString *fromPicture;xx

*/
