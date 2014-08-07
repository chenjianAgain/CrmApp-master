//
//  ZDSecondViewController.m
//  CrmApp
//
//  Created by apple on 14-7-21.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDBusinessesListViewController.h"

@interface ZDBusinessesListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;

@end

@implementation ZDBusinessesListViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BusinessCell"];
    }
    
    cell.textLabel.text = @"朱晓娟";
    cell.detailTextLabel.text = @"共1笔业务";
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
