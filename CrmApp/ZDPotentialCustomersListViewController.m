//
//  ZDFirstViewController.m
//  CrmApp
//
//  Created by apple on 14-7-21.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDPotentialCustomersListViewController.h"
#import "SSFLeftRightSwipeCell/SSFLeftRightSwipeTableViewCell.h"

@interface ZDPotentialCustomersListViewController () <SSFLeftRightSwipeTableViewCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UISearchBar * searchBar;


@end

@implementation ZDPotentialCustomersListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SSFLeftRightSwipeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SSFLeftRightSwipeTableViewCell"];
    [self.searchDisplayController.searchResultsTableView registerNib:[UINib nibWithNibName:@"SSFLeftRightSwipeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SSFLeftRightSwipeTableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSFLeftRightSwipeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SSFLeftRightSwipeTableViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    
    return cell;
}

#pragma mark - search display controller delegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
//    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"customerName contains[cd] %@",searchString];
//    self.filteredChanceCustomers = [self.allChanceCustomers filteredArrayUsingPredicate:predicate];
    return YES;
}

#pragma mark - SSFLeftRightSwipeTableViewCellDelegate

- (void)leftRightSwipeTableViewCellDeleteButtonPressed:(SSFLeftRightSwipeTableViewCell *)cell
{
    
}

- (void)leftRightSwipeTableViewCellEditeButtonPressed:(SSFLeftRightSwipeTableViewCell *)cell
{
    
}

@end
