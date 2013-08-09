//
//  IBKMBookmarkViewController.h
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IBKMBookmark;

@interface IBKMBookmarkViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *URLLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (nonatomic) IBKMBookmark *bookmark;

@end
