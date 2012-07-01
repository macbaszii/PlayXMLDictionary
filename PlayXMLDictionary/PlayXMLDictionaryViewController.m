//
//  PlayXMLDictionaryViewController.m
//  PlayXMLDictionary
//
//  Created by Kiattisak Anoochitarom on 6/11/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "PlayXMLDictionaryViewController.h"
#import "BlognoneServices.h"
#import "NewsDetailViewController.h"

#define kTitle @"title"
#define kLink @"link"

@interface PlayXMLDictionaryViewController () {
    NSDictionary *blognoneDataDict;
    NSArray *newsArray;
    BlognoneServices *sharedServices;
}
    
@end

@implementation PlayXMLDictionaryViewController
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        newsArray = [[NSArray alloc] init];
        blognoneDataDict = [[NSDictionary alloc] init];
        
        self.title = @"Blognone";
        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
        self.navigationItem.rightBarButtonItem = refreshButton;
        
        self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:76.0/255 green:110.0/255 blue:156.0/255 alpha:1.0];
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:76.0/255 green:110.0/255 blue:156.0/255 alpha:1.0];
        self.navigationItem.backBarButtonItem.tintColor = [UIColor colorWithRed:76.0/255 green:110.0/255 blue:156.0/255 alpha:1.0];
        
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:self.tableView];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    sharedServices = [BlognoneServices shareBlognoneServices];
    blognoneDataDict = [sharedServices getBlognoneData];
    newsArray = [[blognoneDataDict objectForKey:@"channel"] objectForKey:@"item"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark Refresh Content

- (IBAction)refresh {
    blognoneDataDict = [sharedServices getBlognoneData];
    newsArray = [[blognoneDataDict objectForKey:@"channel"] objectForKey:@"item"];
    [self.tableView reloadData];
    
//    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
//    [self navigationItem].rightBarButtonItem = barButton;
//    [activityIndicator startAnimating];
}

#pragma mark - Helper Method

- (void)configureCell:(UITableViewCell *)cell atRow:(NSUInteger)row {
    NSDictionary *currentNews = [newsArray objectAtIndex:row];
    cell.textLabel.numberOfLines = 3;
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap; 
    cell.textLabel.text = [currentNews objectForKey:kTitle];
//    cell.detailTextLabel.text = [currentNews objectForKey:kLink];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] initWithNibName:@"NewsDetailViewController" bundle:nil];
    detailViewController.newsContent = [newsArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIndentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    
    [self configureCell:cell atRow:indexPath.row];
    
    return cell;
}

@end
