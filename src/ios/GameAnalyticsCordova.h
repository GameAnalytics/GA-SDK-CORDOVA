#import <Cordova/CDV.h>

@interface GameAnalyticsCordova : CDVPlugin

- (void)configureAvailableCustomDimensions01:(CDVInvokedUrlCommand*)command;
- (void)configureAvailableCustomDimensions02:(CDVInvokedUrlCommand*)command;
- (void)configureAvailableCustomDimensions03:(CDVInvokedUrlCommand*)command;
- (void)configureAvailableResourceCurrencies:(CDVInvokedUrlCommand*)command;
- (void)configureAvailableResourceItemTypes:(CDVInvokedUrlCommand*)command;
- (void)configureBuild:(CDVInvokedUrlCommand*)command;
- (void)configureUserId:(CDVInvokedUrlCommand*)command;
- (void)initialize:(CDVInvokedUrlCommand*)command;
- (void)addBusinessEvent:(CDVInvokedUrlCommand*)command;
- (void)addResourceEvent:(CDVInvokedUrlCommand*)command;
- (void)addProgressionEvent:(CDVInvokedUrlCommand*)command;
- (void)addDesignEvent:(CDVInvokedUrlCommand*)command;
- (void)addErrorEvent:(CDVInvokedUrlCommand*)command;
- (void)setEnabledInfoLog:(CDVInvokedUrlCommand*)command;
- (void)setEnabledVerboseLog:(CDVInvokedUrlCommand*)command;
- (void)setEnabledManualSessionHandling:(CDVInvokedUrlCommand*)command;
- (void)setEnabledEventSubmission:(CDVInvokedUrlCommand*)command;
- (void)setCustomDimension01:(CDVInvokedUrlCommand*)command;
- (void)setCustomDimension02:(CDVInvokedUrlCommand*)command;
- (void)setCustomDimension03:(CDVInvokedUrlCommand*)command;
- (void)setFacebookId:(CDVInvokedUrlCommand*)command;
- (void)setGender:(CDVInvokedUrlCommand*)command;
- (void)setBirthYear:(CDVInvokedUrlCommand*)command;
- (void)startSession:(CDVInvokedUrlCommand*)command;
- (void)endSession:(CDVInvokedUrlCommand*)command;
- (void)getRemoteConfigsValueAsString:(CDVInvokedUrlCommand*)command;
- (void)isRemoteConfigsReady:(CDVInvokedUrlCommand*)command;
- (void)getRemoteConfigsContentAsString:(CDVInvokedUrlCommand*)command;

@end
