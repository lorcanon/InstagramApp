//
//  ProfileViewController.h
//  InstagramApp
//
//  Created by loneill on 09/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
#import "ProfileCollectionViewCell.h"
#import "PostCollectionViewCell.h"


@interface ProfileViewController : UIViewController<NSURLConnectionDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableData *_responseData;
}


@property BOOL awaitingProfile;
@property BOOL awaitingPosts;
@property (weak, nonatomic) NSString *accessToken;
@property BOOL accessTokenIsValid;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
//@property  Profile *profile;
@property  NSObject *profile;

-(BOOL) requestDataWithStringUrl: (NSString *) stringUrl;

@end
