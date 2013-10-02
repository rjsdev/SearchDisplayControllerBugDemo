//
//  RJSViewController.m
//  SearchDisplayControllerBugDemo
//
//  Created by Robert on 2/10/13.
//  Copyright (c) 2013 Robert Stainsby. All rights reserved.
//

#import "RJSViewController.h"

@interface RJSViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchDisplayController * mySearchDisplayController;

@end

@implementation RJSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Comment out the following statement to extend search bar under status bar, as expected
    self.mySearchDisplayController
    = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar
                                        contentsController:self];
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
