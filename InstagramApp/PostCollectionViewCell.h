//
//  PostCollectionViewCell.h
//  InstagramApp
//
//  Created by loneill on 18/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UITextView *Caption;

@end
