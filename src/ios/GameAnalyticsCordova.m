#import "GameAnalyticsCordova.h"
#import "GameAnalytics.h"

#define VERSION @"1.0.7"

@implementation GameAnalyticsCordova

- (void)configureAvailableCustomDimensions01:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* dimensions = [command.arguments objectAtIndex:0];
    [GameAnalytics configureAvailableCustomDimensions01:dimensions];
}

- (void)configureAvailableCustomDimensions02:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* dimensions = [command.arguments objectAtIndex:0];
    [GameAnalytics configureAvailableCustomDimensions02:dimensions];
}

- (void)configureAvailableCustomDimensions03:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* dimensions = [command.arguments objectAtIndex:0];
    [GameAnalytics configureAvailableCustomDimensions03:dimensions];
}

- (void)configureAvailableResourceCurrencies:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* currencies = [command.arguments objectAtIndex:0];
    [GameAnalytics configureAvailableResourceCurrencies:currencies];
}

- (void)configureAvailableResourceItemTypes:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* itemTypes = [command.arguments objectAtIndex:0];
    [GameAnalytics configureAvailableResourceItemTypes:itemTypes];
}

- (void)configureBuild:(CDVInvokedUrlCommand*)command
{
    NSString* build = [command.arguments objectAtIndex:0];
    [GameAnalytics configureBuild:build];
}

- (void)configureUserId:(CDVInvokedUrlCommand*)command
{
    NSString* uId = [command.arguments objectAtIndex:0];
    [GameAnalytics configureUserId:uId];
}

- (void)initialize:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    NSString* gameKey = nil;
    NSString* secretKey = nil;
    NSString* sdkVersion = [NSString stringWithFormat:@"cordova %@", VERSION];
    //NSString* sdkVersion = nil;

    if(args != nil)
    {
        gameKey = args[@"gameKey"];
        secretKey = args[@"secretKey"];
        sdkVersion = args[@"sdkVersion"] ? args[@"sdkVersion"] : [NSString stringWithFormat:@"cordova %@", VERSION];
        //sdkVersion = args[@"sdkVersion"] ? args[@"sdkVersion"] : nil;
    }

    [GameAnalytics configureSdkVersion:sdkVersion];
    [GameAnalytics initializeWithGameKey:gameKey gameSecret:secretKey];
}

- (void)addBusinessEvent:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    NSString* currency = nil;
    NSInteger amount = 0;
    NSString* itemType = nil;
    NSString* itemId = nil;
    NSString* cartType = nil;
    NSString* receipt = nil;
    BOOL autoFetchReceipt = NO;

    if(args != nil)
    {
        currency = args[@"currency"];
        amount = args[@"amount"] ? [[args valueForKey:@"amount"] intValue] : 0;
        itemType = args[@"itemType"];
        itemId = args[@"itemId"];
        cartType = args[@"cartType"];
        receipt = args[@"receipt"];
        autoFetchReceipt = args[@"autoFetchReceipt"] ? [[args valueForKey:@"autoFetchReceipt"] boolValue] : NO;
    }

    if(autoFetchReceipt)
    {
        [GameAnalytics addBusinessEventWithCurrency:currency amount:amount itemType:itemType itemId:itemId cartType:cartType autoFetchReceipt:autoFetchReceipt];
    }
    else
    {
        [GameAnalytics addBusinessEventWithCurrency:currency amount:amount itemType:itemType itemId:itemId cartType:cartType receipt:receipt];
    }
}

- (void)addResourceEvent:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    int flowType;
    NSString* currency = nil;
    double amount = 0;
    NSString* itemType = nil;
    NSString* itemId = nil;

    if(args != nil)
    {
        flowType = args[@"flowType"] ? [[args valueForKey:@"flowType"] intValue] : 0;
        currency = args[@"currency"];
        amount = args[@"amount"] ? [[args valueForKey:@"amount"] doubleValue] : 0;
        itemType = args[@"itemType"];
        itemId = args[@"itemId"];
    }

    [GameAnalytics addResourceEventWithFlowType:(GAResourceFlowType)flowType currency:currency amount:@(amount) itemType:itemType itemId:itemId];
}

- (void)addProgressionEvent:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    int progressionStatus;
    NSString* progression01 = nil;
    NSString* progression02 = nil;
    NSString* progression03 = nil;
    int score = 0;
    BOOL sendScore = NO;

    if(args != nil)
    {
        progressionStatus = args[@"progressionStatus"] ? [[args valueForKey:@"progressionStatus"] intValue] : 0;
        progression01 = args[@"progression01"];
        progression02 = args[@"progression02"];
        progression03 = args[@"progression03"];
        score = args[@"score"] ? [[args valueForKey:@"score"] intValue] : 0;
        sendScore = args[@"score"] ? YES : NO;
    }

    if(sendScore)
    {
        [GameAnalytics addProgressionEventWithProgressionStatus:(GAProgressionStatus)progressionStatus progression01:progression01 progression02:progression02 progression03:progression03 score:score];
    }
    else
    {
        [GameAnalytics addProgressionEventWithProgressionStatus:(GAProgressionStatus)progressionStatus progression01:progression01 progression02:progression02 progression03:progression03];
    }
}

- (void)addDesignEvent:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    NSString* eventId = nil;
    double value = 0;
    BOOL sendValue = NO;

    if(args != nil)
    {
        eventId = args[@"eventId"];
        value = args[@"value"] ? [[args valueForKey:@"value"] doubleValue] : 0;
        sendValue = args[@"value"] ? YES : NO;
    }

    if(sendValue)
    {
        [GameAnalytics addDesignEventWithEventId:eventId value:@(value)];
    }
    else
    {
        [GameAnalytics addDesignEventWithEventId:eventId];
    }
}

- (void)addErrorEvent:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    int severity;
    NSString* message = nil;

    if(args != nil)
    {
        severity = args[@"severity"] ? [[args valueForKey:@"severity"] intValue] : 0;
        message = args[@"message"];
    }

    [GameAnalytics addErrorEventWithSeverity:(GAErrorSeverity)severity message:message];
}

- (void)setEnabledInfoLog:(CDVInvokedUrlCommand*)command
{
    BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
    [GameAnalytics setEnabledInfoLog:flag];
}

- (void)setEnabledVerboseLog:(CDVInvokedUrlCommand*)command
{
    BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
    [GameAnalytics setEnabledVerboseLog:flag];
}

- (void)setEnabledManualSessionHandling:(CDVInvokedUrlCommand*)command
{
    BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
    [GameAnalytics setEnabledManualSessionHandling:flag];
}

- (void)setCustomDimension01:(CDVInvokedUrlCommand*)command
{
    NSString* dimension = [command.arguments objectAtIndex:0];
    [GameAnalytics setCustomDimension01:dimension];
}

- (void)setCustomDimension02:(CDVInvokedUrlCommand*)command
{
    NSString* dimension = [command.arguments objectAtIndex:0];
    [GameAnalytics setCustomDimension02:dimension];
}

- (void)setCustomDimension03:(CDVInvokedUrlCommand*)command
{
    NSString* dimension = [command.arguments objectAtIndex:0];
    [GameAnalytics setCustomDimension03:dimension];
}

- (void)setFacebookId:(CDVInvokedUrlCommand*)command
{
    NSString* facebookId = [command.arguments objectAtIndex:0];
    [GameAnalytics setFacebookId:facebookId];
}

- (void)setGender:(CDVInvokedUrlCommand*)command
{
    int gender = [[command.arguments objectAtIndex:0] intValue];

    if(gender == 1)
    {
        [GameAnalytics setGender:@"male"];
    }
    else if(gender == 2)
    {
        [GameAnalytics setGender:@"female"];
    }
}

- (void)setBirthYear:(CDVInvokedUrlCommand*)command
{
    int year = [[command.arguments objectAtIndex:0] intValue];
    [GameAnalytics setBirthYear:year];
}

- (void)startSession:(CDVInvokedUrlCommand*)command
{
    [GameAnalytics startSession];
}

- (void)endSession:(CDVInvokedUrlCommand*)command
{
    [GameAnalytics endSession];
}

@end
