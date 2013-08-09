//
//  IBKMBookmarkViewController.m
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMBookmarkViewController.h"

#import "IBKMBookmark.h"
#import "IBKMEntry.h"

@interface IBKMBookmarkViewController ()

@end

@implementation IBKMBookmarkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = self.bookmark.entry.title;
    self.titleLabel.text = self.bookmark.entry.title;
    self.URLLabel.text = [self.bookmark.entry.URL absoluteString];
    self.commentLabel.text = self.bookmark.comment;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
