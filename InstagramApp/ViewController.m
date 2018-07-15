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
    [_webview setDelegate:self];
     NSLog(@"viewDidLoad 01");
  //  NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.instagram.com"]];
 //   NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code"]];
   // NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.instagram.com/oauth/authorize/?client_id=5159e3cc93574d1fa7d9fbba32158a35&redirect_uri=https://www.lorcanoneill.ie&response_type=token"]];
    //access_token=8145354658.5159e3c.f7f887f770354e2f995af7e49464d55b
    //https://api.instagram.com/v1/users/self/?access_token=
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.instagram.com/v1/users/self/?access_token=8145354658.5159e3c.f7f887f770354e2f995af7e49464d55b"]];

    [_webview loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"Loading URL :%@", request.URL.absoluteString);
    if (navigationType ==UIWebViewNavigationTypeFormSubmitted) {
        NSLog(@"Form submitted");
    }
    return YES;
}
- (void) webViewDidStartLoad:(UIWebView *)webView
 {
     NSLog(@"webViewDidStartLoad 01");
 }
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad 01");
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError : %@", [error debugDescription]);
}
@end

