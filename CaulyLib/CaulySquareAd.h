//
//  CaulySquareAd.h
//  Cauly
//
//  Created by hylim on 13. 9. 9..
//
//

#import <Foundation/Foundation.h>

@interface CaulySquareAd : NSObject
{
    NSString * _title;
    NSString * _link;
    NSString * _ad_type;
    int _retcode;
    NSString * _retmsg;
    NSString * _grade;
    NSString * _ads_cd;
    NSString * _img_url;
    NSString * _popover_desc;
    int action_type;
    BOOL is_premium;
    NSString  * _url_scheme;   //package 와 동일 
    int _reward;
    NSString * _premium_img_url;
    NSString * _point_url;
    NSString * _desc;
}

@property ( nonatomic , retain) NSString * title;
@property ( nonatomic , retain) NSString * link;
@property ( nonatomic , retain) NSString * ad_type;
@property ( nonatomic ) int retCode;
@property ( nonatomic , retain) NSString * retmsg;
@property ( nonatomic , retain) NSString * grade;
@property ( nonatomic , retain) NSString * ads_cd;
@property ( nonatomic , retain) NSString * img_url;
@property ( nonatomic , retain) NSString * popover_desc;
@property ( nonatomic ) int action_type;
@property ( nonatomic) BOOL is_premium;
@property ( nonatomic , retain ) NSString * url_scheme;
@property ( nonatomic ) int reward;
@property ( nonatomic , retain ) NSString * premium_img_url;
@property ( nonatomic , retain ) NSString * point_url;
@property ( nonatomic , retain ) NSString * desc;


@end
