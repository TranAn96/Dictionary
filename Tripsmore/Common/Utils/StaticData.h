#import <Foundation/Foundation.h>
#define kUD_MainColor @"kUD_MainColor"

@interface StaticData : NSObject

+(StaticData*)sharedInstance;
@property UIColor *mainColor;


@property BOOL isLogOut;
@property NSArray *arrFollowed_Topics;
@property BOOL needShowIntro;
@property (nonatomic, strong) NSDictionary *screenMap;

- (void) parseDataFromArray:(NSArray *) arrSystemSetting;
- (void) cleanData;

@end
