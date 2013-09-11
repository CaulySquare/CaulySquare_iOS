//
//  CaulySquareAd.h
//  Cauly
//
//  Created by hylim on 13. 8. 23..
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CaulyAdSetting.h"
#import "CaulySquareAd.h"

@interface CaulySquare : NSObject{

}

+ (CaulySquare *)initWithAdSetting:(CaulyAdSetting*)adSetting;
+ (CaulySquare *)sharedInstance;

//offerwall 보여주기 
- (void)showOfferwallWithTitle:(NSString*)title;

// offerwall 노출 가능 여부 확인
- (void)checkOfferStatus;


//report action
-(void)reportAction:(CaulySquareActionType)actionType extraInfo:(NSString*)extraInfo;

//becomeActive
-(void)didBecomeActive;

//request offer list
-(void)requestOfferList;

//show detailView
-(void)showDetailsForOffer:(CaulySquareAd *)squareAd;

@property (nonatomic, assign) id<CaulySquareDelegate> delegate;
@property (nonatomic, retain) CaulyAdSetting * localSetting;
@property (nonatomic, readonly) NSString * errorMsg;
@property (nonatomic, retain) NSString * customId;

@property (nonatomic, retain) NSObject * data;


@end


