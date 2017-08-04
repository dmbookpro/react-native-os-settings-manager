
package com.dmbook.RNOsSettingsManager;

import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;
import android.support.v4.app.NotificationManagerCompat;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class RNOsSettingsManagerModule extends ReactContextBaseJavaModule {

  public RNOsSettingsManagerModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @ReactMethod
  public void openAppSettings(boolean openAsNewTask) {
    Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
            Uri.parse("package:" + getCurrentActivity().getPackageName()));
    if ( openAsNewTask ) {
      intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }
    getCurrentActivity().startActivity(intent);
  }

  @ReactMethod
  public void areNotificationsEnabled(Promise promise) {
    try {
      boolean isEnabled = NotificationManagerCompat.from(getReactApplicationContext()).areNotificationsEnabled();
      promise.resolve(isEnabled);
    } catch (Exception e) {
      promise.reject(e);
    }
  }

  @Override
  public String getName() {
    return "RNOsSettingsManager";
  }
}
