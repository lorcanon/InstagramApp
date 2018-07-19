//
//  ProfileCollectionViewController.h
//  InstagramApp
//
//  Created by loneill on 18/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileCollectionViewCell.h"
#import "PostCollectionViewCell.h"
#import "Profile.h"
#import "Post.h"

@interface ProfileCollectionViewController : UICollectionViewController<NSURLConnectionDelegate, UICollectionViewDelegateFlowLayout>
{
    NSMutableData *_responseData;
}

@property (weak, nonatomic) Profile *profile;
@property BOOL awaitingProfile;
@property BOOL awaitingPosts;
@property (weak, nonatomic) NSString *accessToken;
@property BOOL accessTokenIsValid;

-(BOOL) requestDataWithStringUrl: (NSString *) stringUrl;

@end
