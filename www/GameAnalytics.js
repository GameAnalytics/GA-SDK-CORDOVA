var exec = require('cordova/exec');

var PLUGIN_NAME = 'GameAnalytics';

var GameAnalytics = {};

GameAnalytics.EGAErrorSeverity = {
    Undefined: 0,
    Debug: 1,
    Info: 2,
    Warning: 3,
    Error: 4,
    Critical: 5
};

GameAnalytics.EGAResourceFlowType = {
    Undefined: 0,
    Source: 1,
    Sink: 2
};

GameAnalytics.EGAProgressionStatus = {
    Undefined: 0,
    Start: 1,
    Complete: 2,
    Fail: 3
};

GameAnalytics.EGAAdAction = {
    Undefined: 0,
    Clicked: 1,
    Show: 2,
    FailedShow: 3,
    RewardReceived: 4
};

GameAnalytics.EGAAdError = {
    Undefined: 0,
    Unknown: 1,
    Offline: 2,
    NoFill: 3,
    InternalError: 4,
    InvalidRequest: 5,
    UnableToPrecache: 6
};

GameAnalytics.EGAAdType = {
    Undefined: 0,
    Video: 1,
    RewardedVideo: 2,
    Playable: 3,
    Interstitial: 4,
    OfferWall: 5,
    Banner: 6
};

GameAnalytics.configureAvailableCustomDimensions01 = function(customDimensions, onComplete) {
    console.log("GameAnalytics.configureAvailableCustomDimensions01");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureAvailableCustomDimensions01', [customDimensions]);
};

GameAnalytics.configureAvailableCustomDimensions02 = function(customDimensions, onComplete) {
    console.log("GameAnalytics.configureAvailableCustomDimensions02");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureAvailableCustomDimensions02', [customDimensions]);
};

GameAnalytics.configureAvailableCustomDimensions03 = function(customDimensions, onComplete) {
    console.log("GameAnalytics.configureAvailableCustomDimensions03");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureAvailableCustomDimensions03', [customDimensions]);
};

GameAnalytics.configureAvailableResourceCurrencies = function(resourceCurrencies, onComplete) {
    console.log("GameAnalytics.configureAvailableResourceCurrencies");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureAvailableResourceCurrencies', [resourceCurrencies]);
};

GameAnalytics.configureAvailableResourceItemTypes = function(resourceItemTypes, onComplete) {
    console.log("GameAnalytics.configureAvailableResourceItemTypes");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureAvailableResourceItemTypes', [resourceItemTypes]);
};

GameAnalytics.configureBuild = function(build, onComplete) {
    console.log("GameAnalytics.configureBuild");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureBuild', [build]);
};

GameAnalytics.configureAutoDetectAppVersion = function(flag, onComplete) {
    console.log("GameAnalytics.configureAutoDetectAppVersion");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureAutoDetectAppVersion', [flag]);
};

GameAnalytics.configureUserId = function(uId, onComplete) {
    console.log("GameAnalytics.configureUserId");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'configureUserId', [uId]);
};

GameAnalytics.initialize = function(args, onComplete) {
    console.log("GameAnalytics.initialize");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'initialize', [args]);
};

GameAnalytics.addBusinessEvent = function(args, onComplete) {
    console.log("GameAnalytics.addBusinessEvent");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'addBusinessEvent', [args]);
};

GameAnalytics.addResourceEvent = function(args, onComplete) {
    console.log("GameAnalytics.addResourceEvent");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'addResourceEvent', [args]);
};

GameAnalytics.addProgressionEvent = function(args, onComplete) {
    console.log("GameAnalytics.addProgressionEvent");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'addProgressionEvent', [args]);
};

GameAnalytics.addDesignEvent = function(args, onComplete) {
    console.log("GameAnalytics.addDesignEvent");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'addDesignEvent', [args]);
};

GameAnalytics.addErrorEvent = function(args, onComplete) {
    console.log("GameAnalytics.addErrorEvent");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'addErrorEvent', [args]);
};

GameAnalytics.addAdEvent = function(args, onComplete) {
    console.log("GameAnalytics.addAdEvent");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'addAdEvent', [args]);
};

GameAnalytics.setEnabledInfoLog = function(flag, onComplete) {
    console.log("GameAnalytics.setEnabledInfoLog");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setEnabledInfoLog', [flag]);
};

GameAnalytics.setEnabledVerboseLog = function(flag, onComplete) {
    console.log("GameAnalytics.setEnabledVerboseLog");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setEnabledVerboseLog', [flag]);
};

GameAnalytics.setEnabledManualSessionHandling = function(flag, onComplete) {
    console.log("GameAnalytics.setEnabledManualSessionHandling");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setEnabledManualSessionHandling', [flag]);
};

GameAnalytics.setEnabledEventSubmission = function(flag, onComplete) {
    console.log("GameAnalytics.setEnabledEventSubmission");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setEnabledEventSubmission', [flag]);
};

GameAnalytics.setCustomDimension01 = function(dimension, onComplete) {
    console.log("GameAnalytics.setCustomDimension01");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setCustomDimension01', [dimension]);
};

GameAnalytics.setCustomDimension02 = function(dimension, onComplete) {
    console.log("GameAnalytics.setCustomDimension02");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setCustomDimension02', [dimension]);
};

GameAnalytics.setCustomDimension03 = function(dimension, onComplete) {
    console.log("GameAnalytics.setCustomDimension03");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'setCustomDimension03', [dimension]);
};

GameAnalytics.startSession = function(onComplete) {
    console.log("GameAnalytics.startSession");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'startSession', []);
};

GameAnalytics.endSession = function(onComplete) {
    console.log("GameAnalytics.endSession");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'endSession', []);
};

GameAnalytics.getRemoteConfigsValueAsString = function(args, onComplete) {
    console.log("GameAnalytics.getRemoteConfigsValueAsString");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'getRemoteConfigsValueAsString', [args]);
};

GameAnalytics.isRemoteConfigsReady = function(onComplete) {
    console.log("GameAnalytics.isRemoteConfigsReady");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'isRemoteConfigsReady', []);
};

GameAnalytics.getRemoteConfigsContentAsString = function(onComplete) {
    console.log("GameAnalytics.getRemoteConfigsContentAsString");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'getRemoteConfigsContentAsString', []);
};

GameAnalytics.getABTestingId = function(onComplete) {
    console.log("GameAnalytics.getABTestingId");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'getABTestingId', []);
};

GameAnalytics.getABTestingVariantId = function(onComplete) {
    console.log("GameAnalytics.getABTestingVariantId");
    exec(onComplete, GameAnalytics._gameAnalyticsErrorEvent, PLUGIN_NAME, 'getABTestingVariantId', []);
};

/******************************************************************************************************************/
/*                                                PRIVATE/INTERNAL                                                */
/******************************************************************************************************************/

/**
 * Error callback for AudioInputCapture start
 * @private
 */

GameAnalytics._gameAnalyticsErrorEvent = function (e) {
    cordova.fireWindowEvent("gameanalyticserror", {message: e});
};


module.exports = GameAnalytics;
