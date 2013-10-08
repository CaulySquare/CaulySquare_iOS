//
//  CaulySquareDisplayAd.h
//  Cauly
//
//  Created by Jeongdong Hwang on 13. 9. 12..
//
//

#import <UIKit/UIKit.h>
#import "Cauly.h"
#import "CaulyAdSetting.h"

@interface CaulySquareDisplayAd : NSObject

- (id)initWithAdSetting:(CaulyAdSetting *)adSetting;

- (void)request;
- (void)cancelRequest;
- (void)show;

@property (nonatomic, assign) id<CaulySquareDisplayAdDelegate> delegate;
@property (nonatomic, retain) CaulyAdSetting * localSetting;
@property (nonatomic, readonly) NSString * errorMsg;
@property (nonatomic, retain) NSString * customId;

@property (nonatomic, retain) NSObject * data;

@end
