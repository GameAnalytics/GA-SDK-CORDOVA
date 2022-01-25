[![npm](https://img.shields.io/npm/v/cordova-plugin-gameanalytics.svg)](https://www.npmjs.com/package/cordova-plugin-gameanalytics)
[![npm](https://img.shields.io/npm/dt/cordova-plugin-gameanalytics.svg?label=npm%20downloads)](https://www.npmjs.com/package/cordova-plugin-gameanalytics)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

# cordova-plugin-gameanalytics
Official Cordova plugin for the GameAnalytics SDK for Android and iOS.

#### Native Libraries:
Android | iOS
---------- | -----------
[GA-SDK-ANDROID](https://github.com/GameAnalytics/GA-SDK-ANDROID) |  [GA-SDK-IOS](https://cocoapods.org/pods/GA-SDK-IOS)

## Requirements
* Cocoapods (only iOS)

## Installation
From your command prompt/terminal go to your app's root folder and execute:

`cordova plugin add cordova-plugin-gameanalytics`

## Usage
```

onDeviceReady: function() {
    GameAnalytics.initialize({
        gameKey: "[INSERT_GAME_KEY]",
        secretKey: "[INSERT_SECRET_KEY]"
    });

    GameAnalytics.addDesignEvent({
        eventId: "design:event"
    });
}

```

For more documentation click [here](https://gameanalytics.com/docs/cordova-sdk).

If you have any issues or feedback regarding the SDK, please contact our friendly support team [here](https://gameanalytics.com/contact).

Changelog
---------
<!--(CHANGELOG_TOP)-->
**4.2.5**
* switched to use api 30 instead of 31 for android

**4.2.4**
* removed imei identifiers and other alternative identifiers from user identifier logic (android)

**4.2.3**
* added error events to be sent for invalid custom event fields used
* added optional mergeFields argument to event methods to merge with global custom fields instead of overwrite them

**4.2.2**
* fixed build.gradle for android

**4.2.1**
* fixed missing custom event fields for when trying to fix missing session end events

**4.2.0**
* added global custom event fields function to allow to add custom fields to events sent automatically by the SDK

**4.1.2**
* fixed dependencies versions

**4.1.1**
* added functionality to force a new user in a/b testing without having to uninstall app first, simply use custom user id function to set a new user id which hasn't been used yet

**4.1.0**
* added custom event fields feature

**4.0.0**
* Changed user identifier logic in preparation for Google changes to GAID. User id for a new install is now a randomised GUID. Existing installs that update SDK will continue using previous identifier logic. It is recommended to update as soon as possible to reduce impact on calculated metrics.

**3.3.8**
* it should now be possible to not show idfa consent dialog if you don't have any third party code that needs to use idfa (ios)
* prepared for google advertising identifier changes (will not use google advertising identifier when user has opted out) (android)

**3.3.7**
* added idfa consent status field to events (ios)

**3.3.6**
* updated client ts validator

**3.3.5**
* removed memory info from automatic crash reports

**3.3.4**
* fixed dependencies for iOS (min. XCode 12 required)

**3.3.3**
* removed memory info from automatic crash reports

**3.3.2**
* corrected ad event annotation

**3.3.1**
* improved user identifier flow for ios (ios)

**3.3.0**
* added ad event

**3.2.0**
* updated user identifier flow to prepare for iOS 14 IDFA changes (ios)

**3.1.1**
* fixed progression events with scores (android)

**3.1.0**
* exposed functions to get AB testing id and variant id

**3.0.10**
* fixed instant app bug in android native library

**3.0.9**
* updated native lib dependencies

**3.0.8**
* added session_num to init request

**3.0.7**
* config.xml fix

**3.0.6**
* fixes for ios

**3.0.5**
* removed facebook, gender and birthyear methods
* added auto detect app version for build field option

**3.0.4**
* A/B testing fixes

**3.0.3**
* fixed getRemoteConfgisValueAsString bug

**3.0.2**
* remote configs fixed

**3.0.1**
* updated native libs

**3.0.0**
* Remote Config calls have been updated and the old calls have deprecated. Please see GA documentation for the new SDK calls and migration guide
* A/B testing support added

**2.1.0**
* added enable/disable event submission function

**2.0.3**
* added type checks in wrapper layer

**2.0.2**
* fixed business event validation

**2.0.1**
* fixed validator bugs for ios

**2.0.0**
* added command center functionality
* updated google play services dependency version (android)

**1.0.11**
* version fix in plugin.xml

**1.0.10**
* version fix in plugin.xml

**1.0.9**
* lowered required cordova-android to 6.1.2

**1.0.8**
* added custom dimensions to design and error events

**1.0.7**
* fixed session length bug
* fixed now allowing to add events when session is not started

**1.0.6**
* fixed initialize function

**1.0.5**
* updated native libraries to cordova sdk version to events

**1.0.4**
* lowered minimum required cordova version
* changed plugin id to match npm package id

**1.0.3**
* readme updated

**1.0.2**
* plugin description fixes

**1.0.1**
* version fix

**1.0.0**
* initial version
