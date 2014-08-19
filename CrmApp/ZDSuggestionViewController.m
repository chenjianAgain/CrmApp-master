//
//  ZDSuggestionViewController.m
//  CrmApp
//
//  Created by apple on 14-8-19.
//  Copyright (c) 2014年 com.zendai. All rights reserved.
//

#import "ZDSuggestionViewController.h"

@interface ZDSuggestionViewController () <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel* placeholderLabel;
@property (nonatomic, weak) IBOutlet UITextView* suggestionView;

@end

@implementation ZDSuggestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.suggestionView becomeFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.placeholderLabel.hidden = textView.text.length > 0;
}

@end
