//
//  IBKMLoginViewController.h
//  InternBookmark
//
//  Created by Hiroki Kato on 2013/07/16.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBKMLoginViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
