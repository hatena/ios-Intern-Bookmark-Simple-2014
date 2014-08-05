//
//  IBKMBookmarksViewController.m
//  Intern Bookmark
//
//  Created by Hiroki Kato on 2013/07/25.
//  Copyright (c) 2013年 株式会社はてな. All rights reserved.
//

#import "IBKMBookmarksViewController.h"

#import "IBKMBookmarkManager.h"
#import "IBKMBookmark.h"
#import "IBKMEntry.h"
#import "IBKMBookmarkViewController.h"

@interface IBKMBookmarksViewController ()

@end

@implementation IBKMBookmarksViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshBookmarks:) forControlEvents:UIControlEventValueChanged];

    [self refreshBookmarks:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"IBKMOpenBookmarkSegue"]) {
        NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
        IBKMBookmark *bookmark = [IBKMBookmarkManager sharedManager].bookmarks[selected.row];
        
        IBKMBookmarkViewController *bookmarkViewController = segue.destinationViewController;
        bookmarkViewController.bookmark = bookmark;
    }
}

- (void)refreshBookmarks:(id)sender
{
    [self.refreshControl beginRefreshing];

    [[IBKMBookmarkManager sharedManager] reloadBookmarksWithBlock:^(NSError *error) {
        if (error) {
            NSLog(@"error = %@", error);
        }
        [self.tableView reloadData];

        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[IBKMBookmarkManager sharedManager].bookmarks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"IBKMBookmarkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    IBKMBookmark *bookmark = [IBKMBookmarkManager sharedManager].bookmarks[indexPath.row];
    
    cell.textLabel.text = bookmark.entry.title;
    cell.detailTextLabel.text = [bookmark.entry.URL absoluteString];
    
    return cell;
}

#pragma mark - IBAction

/* ログイン画面から戻ったとき呼ばれる */
- (IBAction)closeLoginSegue:(UIStoryboardSegue *)segue
{
    // ログインから戻ったら再読込する.
    [self refreshBookmarks:self];
}

@end
