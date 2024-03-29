//
//  ViewController.m
//  netcat
//
//  Created by Peter Morton on 23/09/12.
//  Copyright (c) 2012 Peter Morton. All rights reserved.
//

#import "ViewController.h"
#import "AsyncSocket.h"

@interface ViewController () <AsyncSocketDelegate>

@property (nonatomic, retain) AsyncSocket *socket;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.socket = [[AsyncSocket alloc] initWithDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    // Copy send buffer to receive 
    NSString *text = [textField.text stringByAppendingString:@"\n"];
    [self.socket writeData:[text dataUsingEncoding:NSASCIIStringEncoding] withTimeout:-1 tag:0];
    
    [textField resignFirstResponder];
    textField.text = @"";
    return YES;
}

- (IBAction)connect:(id)sender {
    if(self.socket.isConnected)
        [self.socket disconnect];
    else
        [self.socket connectToHost:@"172.20.10.6" onPort:12345 error:nil];
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
    self.button.highlighted = YES;
    [sock readDataToData:[AsyncSocket LFData] withTimeout:-1 tag:0];
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock {
    self.button.highlighted = NO;
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSString *text = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    self.receiveBuffer.text = [self.receiveBuffer.text stringByAppendingString:text];
    
    [sock readDataToData:[AsyncSocket LFData] withTimeout:-1 tag:0];
}



@end
