//
//  SMViewController.m
//  TextFieldValidationMethods
//
//  Created by Syngmaster on 29/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController () <UITextFieldDelegate>

@end

@implementation SMViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.delegate = self;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate 

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return YES;
}



@end
