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
//@property (weak, nonatomic) IBOutlet UIImageView *profilePic;

@end

@implementation ProfileViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 /*
    NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@",@"username",@"password"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://www.abcde.com/xyz/login.aspx"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];*/
   // It returns the initialized url connection and begins to load the data for the url request.
    //You can check that whether you URL connection is done properly or not using just if/else statement as below.
 
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://api.instagram.com/v1/users/self/media/recent/?access_token=8145354658.5159e3c.f7f887f770354e2f995af7e49464d55b"]];
    [request setHTTPMethod:@"GET"];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    
        if(conn) {
            NSLog(@"Connection Successful");
        } else {
            NSLog(@"Connection could not be made");
        }


}
// This method is used to receive the data which we get using post method.
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
 _responseData = [[NSMutableData alloc] init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    _responseData = nil;
    NSLog(@"There was an error in connection");
}
-(void) connectionDidFinishLoading:(NSConnection *)connection{
    
    // NSLog(@"DONE. Received Bytes: %d", [responseData length]);
    
    NSString *result = [[NSString alloc] initWithBytes:
                        [_responseData mutableBytes] length:[_responseData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@", result);
    NSMutableArray *JSONResult = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *postArray = [JSONResult valueForKey:@"data"];
    NSLog(@"number of posts %d ", postArray.count);
    NSMutableArray<Post *> *posts =[[NSMutableArray alloc] init];
    
    for (int i = 0; i<postArray.count; i++) {
        Post *posta =  [[Post alloc] init];
        [posta populateFromJSON: [postArray objectAtIndex:i]];
        [posts addObject:posta];
    }
    NSData *imageData  = [NSData dataWithContentsOfURL:[NSURL URLWithString: posts[0].imageUrl]];
    [_profilePic setImage:[UIImage imageWithData:imageData]];

    
    
    
    /*
    Profile *profile =  [[Profile alloc] init];
    [profile populateFromJSON: JSONResult];
    NSLog(@"full name from object%@ ", profile.fullName);
    NSMutableArray *profileTest = [JSONResult valueForKey:@"data"];
    NSString *fullName = [profileTest valueForKey:@"full_name"];
    NSLog(@"full name %@ ", fullName);  */
    /*for (NSMutableDictionary *dict in JSONResult) {
        NSString *string = dict[@"array"];
        if (string) {
            NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
            dict[@"array"] = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        } else {
            NSLog(@"Error in JSON response");
        }
    } */
    
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
