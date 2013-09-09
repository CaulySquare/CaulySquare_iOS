//
//  TestBannerViewController.m
//  CaulySample
//
//  Created by FutureStreamNetworks on 12. 3. 19..
//  Copyright (c) 2012년 FutureStreamNetworks. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    // CaulySquareDelegate setting
    [[CaulySquare sharedInstance] setDelegate:self];
    
    // Check Offer Status call
    [[CaulySquare sharedInstance] checkOfferStatus];
    
    
    
    //Button for Advertiser
    UIButton * completeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    completeBtn.frame = CGRectMake(40, 180, 120, 48);
    [completeBtn setTitle:@"complete" forState:UIControlStateNormal];
    [completeBtn addTarget:self action:@selector(complete:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeBtn];
    
    
    UIButton * executeComplete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    executeComplete.frame = CGRectMake(170, 180, 140, 48);
    [executeComplete setTitle:@"execute complete" forState:UIControlStateNormal];
    [executeComplete addTarget:self action:@selector(executeComplete:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:executeComplete];
    
    

    
   
    
}

//APIs for Advertiser
-(IBAction)complete:(id)sender{
    [[CaulySquare sharedInstance] reportAction:CaulySquareActionTypeComplete extraInfo:nil];        //액션 완료
}

-(IBAction)executeComplete:(id)sender{
     [[CaulySquare sharedInstance] reportAction:CaulySquareActionTypeExecutionComplete extraInfo:nil];       //실행 완료
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (BOOL)shouldAutorotate
{
    return NO;
}


- (void)dealloc {
	[super dealloc];
}

-(IBAction)showOfferwall:(id)sender
{
    [[CaulySquare sharedInstance] showOfferwallWithTitle:@"Title"];    // show offerwall With title
}

#pragma mark CaulySquareDelegate

// offerstatus callback function
- (void)didReceiveOfferStatus:(int)retCode retMsg:(NSString*)retMsg{
//    if(retCode == 1)
    {
        UIButton * showOfferBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        showOfferBtn.frame = CGRectMake(70, 100, 180, 48);
        [showOfferBtn setTitle:@"show offerwall" forState:UIControlStateNormal];
        [showOfferBtn addTarget:self action:@selector(showOfferwall:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:showOfferBtn];
    }
}

//will open offerwall
- (void)willOpenOfferwall{
    NSLog(@"willOpenOfferwall");
}

//close offerwall
- (void)didCloseOfferwall:(int)retCode retMsg:(NSString*)retMsg{
    NSLog(@"didCloseOfferwall");
}


@end
