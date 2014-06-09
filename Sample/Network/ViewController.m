//
//  ViewController.m
//  Network
//
//  Created by Element on 2014. 6. 9..
//  Copyright (c) 2014년 Reveal. All rights reserved.
//

#import "ViewController.h"

#import "ESNetwork.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[ESNetwork sharedInstance] sendRequestRestful:ESNETWORK_RESTFUL_GET withUrl:@"http://bringest.co.kr/mobile_svc/android/0.113/get_company_find.php" withParams:nil withTarget:self];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)didReceiveRequest:(NSString *)url withResult:(NSObject *)result withError:(NSError *)error {
    NSLog(@"url : %@", url);
    NSLog(@"result : %@", result);
    NSLog(@"error : %@", error);
}

@end
