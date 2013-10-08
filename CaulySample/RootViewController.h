//
//  TestBannerViewController.h
//  CaulySample
//
//  Created by FutureStreamNetworks on 12. 3. 19..
//  Copyright (c) 2012년 FutureStreamNetworks. All rights reserved.
//

#import <UIKit/UIKit.h>

//CaulySquare
#import "CaulySquare.h"
#import "CaulySquareDisplayAd.h"

//Cauly banner , interstitialAd
#import "CaulyAdView.h"
#import "CaulyInterstitialAd.h"

// CaulySquareDelegate 추가
@interface RootViewController : UIViewController<CaulySquareDelegate,CaulySquareDisplayAdDelegate , CaulyAdViewDelegate , CaulyInterstitialAdDelegate> {
    
    CaulyAdView * _adView;
    CaulyInterstitialAd * _interstitialAd;
    CaulySquareDisplayAd * _displayAd;
    
    
    IBOutlet UIButton * _showDisplayBtn;
		
}

//@property ( nonatomic , retain ) IBOutlet UIButton * _showDisplayBtn;

- (IBAction)bannerAdButtonAction:(id)sender;
- (IBAction)interstialAdButtonAction:(id)sender;
-(IBAction)checkOfferwall:(id)sender;
-(IBAction)requestDisplay:(id)sender;
-(IBAction)showDisplay:(id)sender;
-(IBAction)action:(id)sender;
-(IBAction)exec:(id)sender;

@end
