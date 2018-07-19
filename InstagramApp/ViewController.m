//
//  ViewController.m
//  InstagramApp
//
//  Created by loneill on 09/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //check if we have a token and it's not corrupt
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"access_token"];
    int checkSumSaved = [[[NSUserDefaults standardUserDefaults] valueForKey:@"a_t_checksum"] intValue] ;
    int acsTokenLength = [accessToken length];
    int checkSum = 0;
    for (int i=0; i<acsTokenLength; i++) {
        checkSum += (int)[accessToken characterAtIndex:i];
    }
    NSLog(@"\n\nPersistent data check\n\n");
    _persistentDataValid = NO;
    if ((checkSum!=0) && (checkSumSaved == checkSum)){
            _persistentDataValid = YES;
            _accessTokenIsValid = YES;
            NSLog(@"\n\nPersistent data valid\n\n");
            self.getDataButton.hidden = NO;

     }
    else
    {
    //no valid token, get one

        [_webview setDelegate:self];
         NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.instagram.com/oauth/authorize/?client_id=5159e3cc93574d1fa7d9fbba32158a35&redirect_uri=https://www.lorcanoneill.ie&response_type=token"]];

        [_webview loadRequest:request];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{   //token will appear in a uri so watch for it and extract it
    NSString *urlWithToken = request.URL.absoluteString;
    if ([urlWithToken containsString:@"access_token"]) {
         NSRange range = [urlWithToken rangeOfString:@"access_token="];
        NSString *accessToken =[urlWithToken substringFromIndex:range.location];
        accessToken = [accessToken substringFromIndex:[@"access_token=" length]];
        NSLog(@"\n\nFound access_token %@ \n\n", accessToken);
        [[NSUserDefaults standardUserDefaults] setValue:accessToken forKey:@"access_token"];
        int checkSum = 0;
        int acsTokenLength = [accessToken length];
        for (int i=0; i<acsTokenLength; i++) {
            checkSum += (int)[accessToken characterAtIndex:i];
        }
        NSNumber *chkNsnumber = [NSNumber numberWithInteger:checkSum];
         [[NSUserDefaults standardUserDefaults] setValue:chkNsnumber forKey:@"a_t_checksum"];
        self.getDataButton.hidden = NO;
    } else {
        NSLog(@"\n\naccess_token not found\n\n");
    }
    NSLog(@"\n\n01 Loading URL :%@ \n\n", request.URL.absoluteString);
    if (navigationType ==UIWebViewNavigationTypeFormSubmitted) {
        NSLog(@"\n\nForm submitted\n\n");
    }
    return YES;
}
- (void) webViewDidStartLoad:(UIWebView *)webView
 {
     NSLog(@"\n\nwebViewDidStartLoad 01\n\n");
 }
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"\n\nwebViewDidFinishLoad 01\n\n");
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"\n\ndidFailLoadWithError : %@ \n\n", [error debugDescription]);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end

