//
//  ProfileViewController.m
//  InstagramApp
//
//  Created by loneill on 09/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import "ProfileViewController.h"
#import "Profile.h"
#import "Post.h"

@interface ProfileViewController () 

@end

@implementation ProfileViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"\n\nPVC viewDidLoad 01\n\n");
    _awaitingProfile = NO;
    _awaitingPosts = NO;
//    if(!_awaitingProfile)
 //   {
        if([self requestDataWithStringUrl: @"https://api.instagram.com/v1/users/self/?access_token=8145354658.5159e3c.f7f887f770354e2f995af7e49464d55b"])
        {
            NSLog(@"\n\nsent Profile request\n\n");
            _awaitingProfile = YES;
        }
 //   }

}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
 _responseData = [[NSMutableData alloc] init];
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
        Profile *profile =  [[Profile alloc] init];
        [profile populateFromJSON: JSONResult];
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
        NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString: posts[0].imageUrl]];
        [_profilePic setImage:[UIImage imageWithData:imageData]];
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

@end
