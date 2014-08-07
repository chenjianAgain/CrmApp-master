//
//  ZDFirstViewController.m
//  CrmApp
//
//  Created by apple on 14-7-21.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDPotentialCustomersListViewController.h"

@interface ZDPotentialCustomersListViewController () <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;

@end

@implementation ZDPotentialCustomersListViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PotentialCustomerCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PotentialCustomerCell"];
    }
    
    cell.textLabel.text = @"许女士";
    cell.detailTextLabel.text = @"一般";
    
    return cell;
}

#pragma mark - UISearchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}
@end
