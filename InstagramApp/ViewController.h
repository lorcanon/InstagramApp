//
//  ViewController.h
//  InstagramApp
//
//  Created by loneill on 09/07/2018.
//  Copyright © 2018 loneill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"

@interface ViewController : UIViewController<UIWebViewDelegate>{
    
    
}
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property BOOL persistentDataValid;
@end

