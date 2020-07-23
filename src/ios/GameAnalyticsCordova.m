#import "GameAnalyticsCordova.h"
#import "GameAnalytics.h"

#define VERSION @"3.2.0"

@implementation GameAnalyticsCordova

- (void)configureAvailableCustomDimensions01:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* array = [command.arguments objectAtIndex:0];
    NSMutableArray *dimensions = [[NSMutableArray alloc] init];
    if(array != nil)
    {
        for (id tempObject in array)
        {
            NSString* s = [tempObject isKindOfClass:[NSString class]] ? tempObject : @"";
            [dimensions addObject:s];
        }
    }
    [GameAnalytics configureAvailableCustomDimensions01:dimensions];
}

- (void)configureAvailableCustomDimensions02:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* array = [command.arguments objectAtIndex:0];
    NSMutableArray *dimensions = [[NSMutableArray alloc] init];
    if(array != nil)
    {
        for (id tempObject in array)
        {
            NSString* s = [tempObject isKindOfClass:[NSString class]] ? tempObject : @"";
            [dimensions addObject:s];
        }
    }
    [GameAnalytics configureAvailableCustomDimensions02:dimensions];
}

- (void)configureAvailableCustomDimensions03:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* array = [command.arguments objectAtIndex:0];
    NSMutableArray *dimensions = [[NSMutableArray alloc] init];
    if(array != nil)
    {
        for (id tempObject in array)
        {
            NSString* s = [tempObject isKindOfClass:[NSString class]] ? tempObject : @"";
            [dimensions addObject:s];
        }
    }
    [GameAnalytics configureAvailableCustomDimensions03:dimensions];
}

- (void)configureAvailableResourceCurrencies:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* array = [command.arguments objectAtIndex:0];
    NSMutableArray *currencies = [[NSMutableArray alloc] init];
    if(array != nil)
    {

        for (id tempObject in array)
        {
            NSString* s = [tempObject isKindOfClass:[NSString class]] ? tempObject : @"";
            [currencies addObject:s];
        }
    }
    [GameAnalytics configureAvailableResourceCurrencies:currencies];
}

- (void)configureAvailableResourceItemTypes:(CDVInvokedUrlCommand*)command
{
    NSMutableArray* array = [command.arguments objectAtIndex:0];
    NSMutableArray *itemTypes = [[NSMutableArray alloc] init];
    if(array != nil)
    {

        for (id tempObject in array)
        {
            NSString* s = [tempObject isKindOfClass:[NSString class]] ? tempObject : @"";
            [itemTypes addObject:s];
        }
    }
    [GameAnalytics configureAvailableResourceItemTypes:itemTypes];
}

- (void)configureBuild:(CDVInvokedUrlCommand*)command
{
    NSString* build = [command.arguments objectAtIndex:0];
    if(build == nil)
    {
        build = @"";
    }
    [GameAnalytics configureBuild:build];
}

- (void)configureAutoDetectAppVersion:(CDVInvokedUrlCommand*)command
{
    if([command.arguments objectAtIndex:0] && [[command.arguments objectAtIndex:0] isKindOfClass:[NSNumber class]] && ([[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:YES]] || [[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:NO]]))
    {
        BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
        [GameAnalytics configureAutoDetectAppVersion:flag];
    }
}

- (void)configureUserId:(CDVInvokedUrlCommand*)command
{
    NSString* uId = [command.arguments objectAtIndex:0];
    if(uId == nil)
    {
        uId = @"";
    }
    [GameAnalytics configureUserId:uId];
}

- (void)initialize:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    NSString* gameKey = nil;
    NSString* secretKey = nil;
    NSString* sdkVersion = [NSString stringWithFormat:@"cordova %@", VERSION];

    if(args != nil)
    {
        gameKey = args[@"gameKey"] && [args[@"gameKey"] isKindOfClass:[NSString class]] ? args[@"gameKey"] : @"";
        secretKey = args[@"secretKey"] && [args[@"secretKey"] isKindOfClass:[NSString class]] ? args[@"secretKey"] : @"";
        sdkVersion = args[@"sdkVersion"] && [args[@"sdkVersion"] isKindOfClass:[NSString class]] ? args[@"sdkVersion"] : [NSString stringWithFormat:@"cordova %@", VERSION];
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
        currency = args[@"currency"] && [args[@"currency"] isKindOfClass:[NSString class]] ? args[@"currency"] : @"";
        amount = args[@"amount"] && [args[@"amount"] isKindOfClass:[NSNumber class]] ? [[args valueForKey:@"amount"] intValue] : 0;
        itemType = args[@"itemType"] && [args[@"itemType"] isKindOfClass:[NSString class]] ? args[@"itemType"] : @"";
        itemId = args[@"itemId"] && [args[@"itemId"] isKindOfClass:[NSString class]] ? args[@"itemId"] : @"";
        cartType = args[@"cartType"] && [args[@"cartType"] isKindOfClass:[NSString class]] ? args[@"cartType"] : @"";
        receipt = args[@"receipt"] && [args[@"cartType"] isKindOfClass:[NSString class]] ? args[@"cartType"] : @"";
        autoFetchReceipt = args[@"autoFetchReceipt"] && [args[@"autoFetchReceipt"] isKindOfClass:[NSNumber class]] && [args[@"autoFetchReceipt"] isEqual:[NSNumber numberWithBool:YES]] ? [[args valueForKey:@"autoFetchReceipt"] boolValue] : NO;
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

    int flowType = 0;
    NSString* currency = nil;
    double amount = 0;
    NSString* itemType = nil;
    NSString* itemId = nil;

    if(args != nil)
    {
        flowType = args[@"flowType"] ? [[args valueForKey:@"flowType"] intValue] : 0;
        currency = args[@"currency"];
        amount = args[@"amount"] && [args[@"amount"] isKindOfClass:[NSNumber class]] ? [[args valueForKey:@"amount"] doubleValue] : 0;
        itemType = args[@"itemType"];
        itemId = args[@"itemId"];
    }

    [GameAnalytics addResourceEventWithFlowType:(GAResourceFlowType)flowType currency:currency amount:@(amount) itemType:itemType itemId:itemId];
}

- (void)addProgressionEvent:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];

    int progressionStatus = 0;
    NSString* progression01 = nil;
    NSString* progression02 = nil;
    NSString* progression03 = nil;
    int score = 0;
    BOOL sendScore = NO;

    if(args != nil)
    {
        progressionStatus = args[@"progressionStatus"] && [args[@"progressionStatus"] isKindOfClass:[NSNumber class]] ? [[args valueForKey:@"progressionStatus"] intValue] : 0;
        progression01 = args[@"progression01"] && [args[@"progression01"] isKindOfClass:[NSString class]] ? args[@"progression01"] : @"";
        progression02 = args[@"progression02"] && [args[@"progression02"] isKindOfClass:[NSString class]] ? args[@"progression02"] : @"";
        progression03 = args[@"progression03"] && [args[@"progression03"] isKindOfClass:[NSString class]] ? args[@"progression03"] : @"";
        score = args[@"score"] && [args[@"score"] isKindOfClass:[NSNumber class]] ? [[args valueForKey:@"score"] intValue] : 0;
        sendScore = args[@"score"] && [args[@"score"] isKindOfClass:[NSNumber class]] ? YES : NO;
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
        eventId = args[@"eventId"] && [args[@"eventId"] isKindOfClass:[NSString class]] ? args[@"eventId"] : @"";
        value = args[@"value"] && [args[@"value"] isKindOfClass:[NSNumber class]] ? [[args valueForKey:@"value"] doubleValue] : 0;
        sendValue = args[@"value"] && [args[@"value"] isKindOfClass:[NSNumber class]] ? YES : NO;
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

    int severity = 0;
    NSString* message = nil;

    if(args != nil)
    {
        severity = args[@"severity"] && [args[@"severity"] isKindOfClass:[NSNumber class]] ? [[args valueForKey:@"severity"] intValue] : 0;
        message = args[@"message"] && [args[@"message"] isKindOfClass:[NSString class]] ? args[@"message"] : @"";
    }

    [GameAnalytics addErrorEventWithSeverity:(GAErrorSeverity)severity message:message];
}

- (void)setEnabledInfoLog:(CDVInvokedUrlCommand*)command
{
    if([command.arguments objectAtIndex:0] && [[command.arguments objectAtIndex:0] isKindOfClass:[NSNumber class]] && ([[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:YES]] || [[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:NO]]))
    {
        BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
        [GameAnalytics setEnabledInfoLog:flag];
    }
}

- (void)setEnabledVerboseLog:(CDVInvokedUrlCommand*)command
{
    if([command.arguments objectAtIndex:0] && [[command.arguments objectAtIndex:0] isKindOfClass:[NSNumber class]] && ([[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:YES]] || [[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:NO]]))
    {
        BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
        [GameAnalytics setEnabledVerboseLog:flag];
    }
}

- (void)setEnabledManualSessionHandling:(CDVInvokedUrlCommand*)command
{
    if([command.arguments objectAtIndex:0] && [[command.arguments objectAtIndex:0] isKindOfClass:[NSNumber class]] && ([[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:YES]] || [[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:NO]]))
    {
        BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
        [GameAnalytics setEnabledManualSessionHandling:flag];
    }
}

- (void)setEnabledEventSubmission:(CDVInvokedUrlCommand*)command
{
    if([command.arguments objectAtIndex:0] && [[command.arguments objectAtIndex:0] isKindOfClass:[NSNumber class]] && ([[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:YES]] || [[command.arguments objectAtIndex:0] isEqual:[NSNumber numberWithBool:NO]]))
    {
        BOOL flag = [[command.arguments objectAtIndex:0] boolValue];
        [GameAnalytics setEnabledEventSubmission:flag];
    }
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

- (void)startSession:(CDVInvokedUrlCommand*)command
{
    [GameAnalytics startSession];
}

- (void)endSession:(CDVInvokedUrlCommand*)command
{
    [GameAnalytics endSession];
}

- (void)getRemoteConfigsValueAsString:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* args = [command.arguments objectAtIndex:0];
    NSString* key = nil;
    NSString* defaultValue = nil;

    if(args != nil)
    {
        key = args[@"key"] && [args[@"key"] isKindOfClass:[NSString class]] ? args[@"key"] : @"";
        defaultValue = args[@"defaultValue"] && [args[@"defaultValue"] isKindOfClass:[NSString class]] ? args[@"defaultValue"] : @"";
    }

    NSString* result = nil;
    if(defaultValue)
    {
        result = [GameAnalytics getRemoteConfigsValueAsString:key defaultValue:defaultValue];
    }
    else
    {
        result = [GameAnalytics getRemoteConfigsValueAsString:key];
    }
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isRemoteConfigsReady:(CDVInvokedUrlCommand*)command
{
    BOOL result = [GameAnalytics isRemoteConfigsReady];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getRemoteConfigsContentAsString:(CDVInvokedUrlCommand*)command
{
    NSString* result = [GameAnalytics getRemoteConfigsContentAsString];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getABTestingId:(CDVInvokedUrlCommand*)command
{
    NSString* result = [GameAnalytics getABTestingId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getABTestingVariantId:(CDVInvokedUrlCommand*)command
{
    NSString* result = [GameAnalytics getABTestingVariantId];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
