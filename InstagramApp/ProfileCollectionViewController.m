//
//  ProfileCollectionViewController.m
//  InstagramApp
//
//  Created by loneill on 18/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import "ProfileCollectionViewController.h"

@interface ProfileCollectionViewController ()

@end

@implementation ProfileCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
     [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"standard_cell"];
  // [self.collectionView registerClass:[ProfileCollectionViewCell class] forCellWithReuseIdentifier:@"profile"];
    //[self.collectionView registerClass:[PostCollectionViewCell class] forCellWithReuseIdentifier:@"post"];
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark <UICollectionViewDelegateFlowLayout>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(collectionView.frame.size.width, 320);
    }
    if (indexPath.section == 1) {
        return CGSizeMake(collectionView.frame.size.width, 320);
    }
    if (indexPath.section == 2) {
        return CGSizeMake(collectionView.frame.size.width, 426);
    }
    return CGSizeMake(collectionView.frame.size.width, 426);
}


#pragma mark <UICollectionViewDataSource>



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
        return 2;
    }
    else
    {
        return 5;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   // UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   // UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"standard_cell" forIndexPath:indexPath];
  //  ProfileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"profile" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        ProfileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"profile" forIndexPath:indexPath];
        NSString *profilePicUrl = [[NSUserDefaults standardUserDefaults] valueForKey:@"profile"];
        NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString: profilePicUrl]];
        [cell.profilePic setImage:[UIImage imageWithData:imageData]];
        return cell;
    }
    else// if(indexPath.section == 1)
    {
        ProfileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"post" forIndexPath:indexPath];
        return cell;
    }
        
    // Configure the cell
    
    //return cell;
}

#pragma mark <UICollectionViewDelegate>


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
