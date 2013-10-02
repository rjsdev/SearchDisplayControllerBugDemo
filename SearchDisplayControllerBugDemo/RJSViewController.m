//
//  RJSViewController.m
//  SearchDisplayControllerBugDemo
//
//  Created by Robert on 2/10/13.
//  Copyright (c) 2013 Robert Stainsby. All rights reserved.
//

#import "RJSViewController.h"

@interface RJSViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchBar;
@property (nonatomic, strong) UISearchDisplayController * mySearchDisplayController;

@end

@implementation RJSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    // Comment out the following statement to extend search bar under status bar, as expected
    self.mySearchDisplayController
    = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar
                                        contentsController:self];
    
}

-(void)viewDidLayoutSubviews
{
    self.searchBar.frame = CGRectMake(0.0,
                                      20.0,
                                      CGRectGetWidth(self.view.bounds),
                                      44.0
                                      );
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    UIBarPosition result = UIBarPositionTopAttached;
    
    if ( bar == self.searchBar )
    {
        result = UIBarPositionTopAttached;
    }
    
    return result;
}

@end
