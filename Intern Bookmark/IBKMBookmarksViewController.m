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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[IBKMBookmarkManager sharedManager] reloadBookmarksWithBlock:^(NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        }
        [self.tableView reloadData];
    }];
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

@end
