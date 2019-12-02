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
