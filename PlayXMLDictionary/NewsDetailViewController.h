//
//  NewsDetailViewController.h
//  PlayXMLDictionary
//
//  Created by Kiattisak Anoochitarom on 6/11/55 BE.
//  Copyright (c) 2555 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailViewController : UIViewController

@property (nonatomic, weak) NSDictionary *newsContent;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *ownerLabel;
@property (nonatomic, weak) IBOutlet UIWebView *newsWebView;

@end
