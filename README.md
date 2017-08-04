# React Native OS Settings Manager

This is a native module to interact with Android/IOS settings.

## Installation

`npm install --save react-native-os-settings-manager`

`react-native link`

## Features

### ANDROID

| Method name             | Return value    |
|-------------------------|:---------------:|
| areNotificationsEnabled |  Boolean        |
| openAppSettings         | Void            |

### IOS

| Method name             | Return value                                                    |
|-------------------------|:---------------------------------------------------------------:|
| areNotificationsEnabled | `{badge:1, alert:1, sound:1}` or `{}` if notifications disabled |
| openAppSettings         | Void                                                            |

## Usage
```javascript
import RNOsSettingsManager from 'react-native-os-settings-manager';

/**
* This will open the os settings of your application.
*/
RNOsSettingsManager.accessAppSettings();

/**
* This will tell you if notifications are enabled or not in Android/IOS settings
*/
let notifications_enabled = await RNOsSettingsManager.areNotificationsEnabled();

if ( Platform.OS == 'android' ) {
	// ANDROID device
	console.assert(notifications_enabled == true,
		'It means that the notifications for your application are enabled');

	console.assert(notifications_enabled == false,
		'It means that the notifications for your application are disabled');

} else if ( Platform.OS == 'ios' ) {
	// IOS device
	console.assert(notifications_enabled.badge !== undefined,
		"It means that notification's badge for your application is enabled");

	console.assert(notifications_enabled.alert !== undefined,
		"It means that notification's alert for your application is enabled");

	console.assert(notifications_enabled.sound !== undefined,
		"It means that notification's sound for your application is enabled");

	console.assert(isNotificationEnabled === {},
		"It means that the notifications for your application are disabled");
}
```
