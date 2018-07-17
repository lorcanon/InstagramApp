//
//  ProfileViewController.h
//  InstagramApp
//
//  Created by loneill on 09/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
}


@property BOOL awaitingProfile;
@property BOOL awaitingPosts;

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
-(BOOL) requestDataWithStringUrl: (NSString *) stringUrl;

@end
