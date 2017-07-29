//
//  SMViewController.m
//  TextFieldValidationMethods
//
//  Created by Syngmaster on 29/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController () <UITextFieldDelegate>

@property (assign, nonatomic) BOOL hasAtSign;

@end

@implementation SMViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.hasAtSign = NO;
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

#pragma mark - Validation Check for TextField

- (BOOL)validationNumericCheckFrom:(UITextField *) textField inString:(NSString *) string {
    
    NSCharacterSet *set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *words = [string componentsSeparatedByCharactersInSet:set];
    
    if ([words count] > 1) {
        
        return NO;
        
    }
    
    return YES;
    
}

- (BOOL)validationCheckOfCharactersEmailFieldFrom:(UITextField *) textField string:(NSString *) string inRange:(NSRange) range {
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@":;'\"()+-"];
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSArray *words = [string componentsSeparatedByCharactersInSet:set];
    
    if ([words count] > 1 || [newString length] > 50) {
        return NO;
    }
    
    if ([textField.text length] == 0) {
        self.hasAtSign = YES;
    }
    
    if ([textField.text length] == 0 && [string isEqualToString:@"@"]) {
        
        return NO;
        
    } else if ([string isEqualToString:@"@"] && self.hasAtSign) {
        
        self.hasAtSign = NO;
        
    } else if ([string isEqualToString:@"@"] && !self.hasAtSign) {
        
        return NO;
        
    }
    
    return YES;
    
}


@end
