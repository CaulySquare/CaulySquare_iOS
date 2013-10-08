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
    
    // CaulySquareDelegate setting
    [[CaulySquare sharedInstance] setDelegate:self];
    
    
    
    
    [_showDisplayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}


- (IBAction)bannerAdButtonAction:(id)sender
{
    CaulyAdSetting * adSetting = [CaulyAdSetting globalSetting];
    [CaulyAdSetting setLogLevel:CaulyLogLevelAll];              //  Cauly Log 레벨
    adSetting.appCode               = @"CAULY";                 //  Cauly AppCode
	adSetting.animType              = CaulyAnimCurlUp;            //  화면 전환 효과
	adSetting.useGPSInfo            = NO;                       //  GPS 수집 허용여부
    adSetting.adSize                = CaulyAdSize_IPhone;    //  광고 크기
    adSetting.reloadTime            = CaulyReloadTime_30;       //  광고 갱신 시간
    adSetting.useDynamicReloadTime  = YES;                      //  동적 광고 갱신 허용
    
    
    _adView = [[CaulyAdView alloc] initWithParentViewController:self];      //  CaulyAdView 객체 생성
	[self.view addSubview:_adView];
	_adView.delegate = self;                                                //  delegate 설정
    _adView.showPreExpandableAd = TRUE;

    
    [_adView startBannerAdRequest];
}

- (IBAction)interstialAdButtonAction:(id)sender {
	if(_interstitialAd)
		return;
	
	_interstitialAd = [[CaulyInterstitialAd alloc] initWithParentViewController:self];  //  전면광고 객체 생성
	_interstitialAd.delegate = self;                                                    //  전면 delegate 설정
	[_interstitialAd startInterstitialAdRequest];                                       //  전면광고 요청
    
}


-(IBAction)requestDisplay:(id)sender
{
    if(_displayAd)
        return;
    
    
    _displayAd = [[CaulySquareDisplayAd alloc] initWithAdSetting:[CaulyAdSetting adSettingWithAppCode:@"squaretest4"]];
    _displayAd.delegate = self;
    
    [_displayAd request];
}

-(IBAction)showDisplay:(id)sender
{
    [_displayAd show];
}

//APIs for Advertiser
-(IBAction)action:(id)sender{
    [[CaulySquare sharedInstance] reportAction:CaulySquareActionTypeComplete extraInfo:nil];        //액션 완료
}

-(IBAction)exec:(id)sender{
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

-(IBAction)checkOfferwall:(id)sender
{
    // Check Offer Status call
    [[CaulySquare sharedInstance] checkOfferStatus];
}


// Cauly 광고 이벤트 Delegate
#pragma mark CaulyDelegate


// 광고 정보 수신 성공
- (void)didReceiveAd:(CaulyAdView *)adView isChargeableAd:(BOOL)isChargeableAd{
    
}

// 광고 정보 수신 실패
- (void)didFailToReceiveAd:(CaulyAdView *)adView errorCode:(int)errorCode errorMsg:(NSString *)errorMsg{
    
}

// 랜딩 화면 표시
- (void)willShowLandingView:(CaulyAdView *)adView{
    
}

// 랜딩 화면이 닫혔을 때
- (void)didCloseLandingView:(CaulyAdView *)adView{
    
}

#pragma mark - CaulyInterstitialAdDelegate

// 광고 정보 수신 성공
- (void)didReceiveInterstitialAd:(CaulyInterstitialAd *)interstitialAd isChargeableAd:(BOOL)isChargeableAd {
	NSLog(@"didReceiveInterstitialAd");
	[_interstitialAd show];
	[_interstitialAd release];
	_interstitialAd = nil;
}

// Interstitial 형태의 광고가 닫혔을 때
- (void)didCloseInterstitialAd:(CaulyInterstitialAd *)interstitialAd {
	NSLog(@"didCloseInterstitialAd");
	[_interstitialAd release];
	_interstitialAd = nil;
}

// Interstitial 형태의 광고가 보여지기 직전
- (void)willShowInterstitialAd:(CaulyInterstitialAd *)interstitialAd {
	NSLog(@"willShowInterstitialAd");
}

// 광고 정보 수신 실패
- (void)didFailToReceiveInterstitialAd:(CaulyInterstitialAd *)interstitialAd errorCode:(int)errorCode errorMsg:(NSString *)errorMsg {
	NSLog(@"didFailToReceiveInterstitialAd : %d(%@)", errorCode, errorMsg);
	[_interstitialAd release];
	_interstitialAd = nil;
}




#pragma mark CaulySquareDelegate


- (void)didReceiveOfferStatus:(int)retCode retMsg:(NSString*)retMsg{
    NSLog(@"didReceiveOfferStatus  retCode : %d , retMsg : %@",retCode , retMsg);
    if(retCode == 1)
    {
        [[CaulySquare sharedInstance] showOfferwallWithTitle:@"Title"];    // show offerwall With title
    }
}

- (void)willOpenOfferwall{
    NSLog(@"willOpenOfferwall");
}

- (void)didCloseOfferwall:(int)retCode retMsg:(NSString*)retMsg{
    NSLog(@"didCloseOfferwall  retCode : %d , retMsg : %@",retCode , retMsg);
}

- (void)didReceiveOfferList:(NSArray*)offerArray retCode:(int)retCode retMsg:(NSString*)retMsg{
    if([offerArray count] > 0)
        [[CaulySquare sharedInstance] showDetailsForOffer:[offerArray objectAtIndex:0]];
    else
        [[CaulySquare sharedInstance] showDetailsForOffer:nil];
}

//open offer details
- (void)willOpenOfferDetails{
    NSLog(@"willOpenOfferDetails");
}

//close offer details
- (void)didCloseOfferDetails:(int)retCode retMsg:(NSString*)retMsg{
    NSLog(@"didCloseOfferDetails  retCode : %d , retMsg : %@",retCode , retMsg);
}


#pragma mark CaulySquareDisplayDelegate
- (void)didReceiveSquareDisplayAd:(CaulySquareDisplayAd *)displayAd
{
    [_showDisplayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

// 광고 정보 수신 실패
- (void)didFailToReceiveDisplayAd:(CaulySquareDisplayAd *)displayAd errorCode:(int)errorCode errorMsg:(NSString *)errorMsg
{
    NSLog(@"didFailToReceiveDisplayAd errorCode : %d , errorMsg : %@",errorCode , errorMsg);
    [_displayAd release];
	_displayAd = nil;
}

// Interstitial 형태의 광고가 보여지기 직전
- (void)willShowDisplayAd:(CaulySquareDisplayAd *)displayAd
{
    NSLog(@"willShowDisplayAd");
}

// Interstitial 형태의 광고가 닫혔을 때
- (void)didCloseDisplayAd:(CaulySquareDisplayAd *)displayAd
{
    NSLog(@"didCloseDisplayAd");
    [_showDisplayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_displayAd release];
	_displayAd = nil;
}

#pragma mark -


// Add this Method
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
