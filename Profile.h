//
//  Profile.h
//  InstagramApp
//
//  Created by loneill on 16/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject


@property (weak, nonatomic) NSString *id;
@property (weak, nonatomic) NSString *username;
@property (weak, nonatomic) NSString *profile_picture;
@property (weak, nonatomic) NSString *fullName;
@property (weak, nonatomic) NSString *bio;
@property (weak, nonatomic) NSString *website;
@property BOOL isBusiness;
@property (weak, nonatomic) NSString *countsMedia;
@property (weak, nonatomic) NSString *countsFollows;
@property (weak, nonatomic) NSString *countsFollowedBy;
@property (weak, nonatomic) NSString *metaCode;
-(void) populateFromJSON: (NSMutableArray *)JSONResult;

@end
