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


