//
//  Profile.m
//  InstagramApp
//
//  Created by loneill on 16/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import "Profile.h"

@implementation Profile
-(void) populateFromJSON: (NSMutableArray *)JSONResult
{
    NSMutableArray *profile = [JSONResult valueForKey:@"data"];
    _id = [profile valueForKey:@"id"];;
    _username = [profile valueForKey:@"username"];;
    _profile_picture = [profile valueForKey:@"profile_picture"];;
    _fullName = [profile valueForKey:@"full_name"];
    _bio = [profile valueForKey:@"bio"];
    _website = [profile valueForKey:@"website"];
   // _isBusiness = [profile valueForKey:@"is_business"];
    NSNumber *yesNo = (NSNumber *)[profile valueForKey: @"is_business"];
    if([yesNo boolValue] == NO){
   // if ([[profile valueForKey:@"is_business"] boolValue] == false) {
        _isBusiness = NO;
    } else {
        _isBusiness = YES;
    }
    NSMutableArray *counts = [profile valueForKey:@"counts"];
    _countsMedia = [counts valueForKey:@"media"];
    _countsFollows = [counts valueForKey:@"follows"];
    _countsFollowedBy = [counts valueForKey:@"followed_by"];
    NSMutableArray *meta = [JSONResult valueForKey:@"meta"];
    _metaCode = [meta valueForKey:@"code"];
}

@end
