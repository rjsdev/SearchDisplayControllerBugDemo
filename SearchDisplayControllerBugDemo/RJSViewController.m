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
@property (nonatomic, strong) UIToolbar * toolbar;
@property (nonatomic, strong) UISearchDisplayController * mySearchDisplayController;

@end

@implementation RJSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.toolbar];
    
    // Comment out the following statement to extend search bar under status bar, as expected
    self.mySearchDisplayController
    = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar
                                        contentsController:self];
    
}

-(void)viewDidLayoutSubviews
{
    const CGFloat kDefaultStatusBarHeight = 20.0;
    const CGFloat kBarHeight = 44.0;
    
    self.searchBar.frame = CGRectMake(0.0,
                                      kDefaultStatusBarHeight,
                                      CGRectGetWidth(self.view.bounds),
                                      kBarHeight
                                      );

    self.toolbar.frame = CGRectMake(0.0,
                                    CGRectGetHeight(self.view.bounds) - kBarHeight,
                                    CGRectGetWidth(self.view.bounds),
                                    kBarHeight
                                    );
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    UIBarPosition result = UIBarPositionAny;
    
    if ( bar == self.searchBar )
    {
        result = UIBarPositionTopAttached;
    }
    
    return result;
}

@end
