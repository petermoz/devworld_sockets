//
//  ViewController.m
//  netcat
//
//  Created by Peter Morton on 23/09/12.
//  Copyright (c) 2012 Peter Morton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    // Copy send buffer to receive 
    NSString *text = textField.text;
    self.receiveBuffer.text = [self.receiveBuffer.text stringByAppendingFormat:@"%@\n", text];
    
    [textField resignFirstResponder];
    textField.text = @"";
    return YES;
}




@end
