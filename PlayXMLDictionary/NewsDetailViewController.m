//
//  NewsDetailViewController.m
//  PlayXMLDictionary
//
//  Created by Kiattisak Anoochitarom on 6/11/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import "NewsDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kTitle @"title"
#define kOwner @"dc:creator"
#define kDesc @"description"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController
@synthesize newsContent;
@synthesize titleLabel, newsWebView, ownerLabel;

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
    [self updateUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Helper Method

- (void)updateUI {
    self.titleLabel.clipsToBounds = YES;
    self.titleLabel.layer.cornerRadius = 10.0;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    self.titleLabel.textAlignment = UITextAlignmentCenter;
    
    self.newsWebView.opaque = NO;
    self.newsWebView.backgroundColor = [UIColor clearColor];
    self.newsWebView.clipsToBounds = YES;
    self.newsWebView.layer.cornerRadius = 15.0;
    
    self.ownerLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:16];
    self.ownerLabel.textColor = [UIColor blackColor];
    
    self.titleLabel.text = [NSString stringWithFormat:@"    %@",[self.newsContent objectForKey:kTitle]];
    self.ownerLabel.text = [NSString stringWithFormat:@"by %@",[self.newsContent objectForKey:kOwner]];
//    self.newsWebView.contentStretch = self.newsWebView.bounds;
    [self.newsWebView loadHTMLString:[self.newsContent objectForKey:kDesc] baseURL:nil];
}

@end