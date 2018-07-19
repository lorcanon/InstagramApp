//
//  ProfileCollectionViewCell.h
//  InstagramApp
//
//  Created by loneill on 18/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Profile.h"

@interface ProfileCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *followedBy;

@end
