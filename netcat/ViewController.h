//
//  ViewController.h
//  netcat
//
//  Created by Peter Morton on 23/09/12.
//  Copyright (c) 2012 Peter Morton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *sendBuffer;
@property (weak, nonatomic) IBOutlet UITextView *receiveBuffer;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)connect:(id)sender;

@end
