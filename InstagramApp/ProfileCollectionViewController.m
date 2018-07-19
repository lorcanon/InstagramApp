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
 
    // Do any additional setup after loading the view.
    
    _awaitingProfile = NO;
    _awaitingPosts = NO;
    _accessToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"access_token"];
    NSString *endpoint = [@"https://api.instagram.com/v1/users/self/?access_token=" stringByAppendingString:_accessToken];
    if([self requestDataWithStringUrl: endpoint])
    //if([self requestDataWithStringUrl: @"https://api.instagram.com/v1/users/self/?access_token=8145354658.5159e3c.f7f887f770354e2f995af7e49464d55b"])
    {
        NSLog(@"\n\nsent Profile request\n\n");
        _awaitingProfile = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    _responseData = nil;
    NSLog(@"\n\n\n**************There was an error in connection %@ *************\n\n\n", error);
}


-(void) connectionDidFinishLoading:(NSConnection *)connection{
    
    // NSLog(@"DONE. Received Bytes: %d", [responseData length]);
    
    NSString *result = [[NSString alloc] initWithBytes:
                        [_responseData mutableBytes] length:[_responseData length] encoding:NSUTF8StringEncoding];
    NSLog(@"\n\n\nJason string%@\n\n\n", result);
    NSMutableArray *JSONResult = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
    if (_awaitingProfile) {
        Profile * profile =  [[Profile alloc] init];
        [profile populateFromJSON: JSONResult];
        _profile =  profile;
        [[NSUserDefaults standardUserDefaults] setValue:((Profile *)_profile).profile_picture forKey:@"profile"];
        NSLog(@"\n\n\nfullName to defaults %@\n\n\n", _profile.fullName);
        [[NSUserDefaults standardUserDefaults] setValue:_profile.fullName forKey:@"full_name"];
 
        _awaitingProfile = NO;
        if([self requestDataWithStringUrl: @"https://api.instagram.com/v1/users/self/media/recent/?access_token=8145354658.5159e3c.f7f887f770354e2f995af7e49464d55b"])
        {
            NSLog(@"\n\nsent Posts request\n\n");
            _awaitingPosts = YES;
        }
        
    }
    else if(_awaitingPosts)
    {
        NSMutableArray *postArray = [JSONResult valueForKey:@"data"];
        NSLog(@"\n\nnumber of posts %d \n\n", postArray.count);
        NSMutableArray<Post *> *posts =[[NSMutableArray alloc] init];
        
        for (int i = 0; i<postArray.count; i++) {
            Post *posta =  [[Post alloc] init];
            [posta populateFromJSON: [postArray objectAtIndex:i]];
            [posts addObject:posta];
        }
        [[NSUserDefaults standardUserDefaults] setValue:posts[0].imageUrl forKey:@"picture01"];
        [[NSUserDefaults standardUserDefaults] setValue:posts[0].fullName forKey:@"full_name01"];
        [[NSUserDefaults standardUserDefaults] setValue:posts[0].captionText forKey:@"caption01"];
        [[NSUserDefaults standardUserDefaults] setValue:posts[1].imageUrl forKey:@"picture02"];
        [[NSUserDefaults standardUserDefaults] setValue:posts[1].fullName forKey:@"full_name02"];
        [[NSUserDefaults standardUserDefaults] setValue:posts[1].captionText forKey:@"caption02"];
        [self.collectionView reloadData];
    //    NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString: posts[0].imageUrl]];
    //    [_profilePic setImage:[UIImage imageWithData:imageData]];
        _awaitingPosts = NO;
    }
}

-(BOOL) requestDataWithStringUrl: (NSString *) stringUrl
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:stringUrl]];
    [request setHTTPMethod:@"GET"];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(conn) {
        NSLog(@"************************Connection Successful******************");
        return YES;
    } else {
        NSLog(@"**************Connection could not be made***************");
        return NO;
    }
    
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

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _responseData = [[NSMutableData alloc] init];
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
        cell.name.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"full_name"];
  //      cell.followedBy.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"followed_by"];
        //cell.name.text = @"Test";
         return cell;
    }
    else// if(indexPath.section == 1)
    {
        PostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"post" forIndexPath:indexPath];
//        PostCollectionViewCell *cell = [collectionViewdequeueReusableCellWithReuseIdentifier:@"post" forIndexPath:indexPath];
        NSLog(@"\n\n\nsection  row %d %d\n\n\n", indexPath.section, indexPath.row);
        if(indexPath.row == 0)
        {
            NSString *picUrl = [[NSUserDefaults standardUserDefaults] valueForKey:@"picture01"];
            NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString: picUrl]];
            [cell.picture setImage:[UIImage imageWithData:imageData]];
            cell.Name.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"full_name01"];
            cell.Caption.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"caption01"];
        }
        if(indexPath.row == 1)
        {
            NSString *picUrl = [[NSUserDefaults standardUserDefaults] valueForKey:@"picture02"];
            NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString: picUrl]];
            [cell.picture setImage:[UIImage imageWithData:imageData]];
            cell.Name.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"full_name02"];
            cell.Caption.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"caption02"];
        }
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
