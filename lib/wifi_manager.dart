import 'dart:io';
import 'package:flutter/services.dart';

class WifiManager {
  WifiManager._();

  static const _channel = MethodChannel("WIFI_MANAGER_CHANNEL");

  static Future<bool?> isWifiEnabled() async {
    if (Platform.isAndroid) {
      try {
        final result = await _channel.invokeMethod<bool?>("isWifiEnabled");
        return result;
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  static Future<bool> turnOnWifi() async {
    if (Platform.isAndroid) {
      try {
        await _channel.invokeMethod("turnOnWifi");
        return true;
      } catch (e) {
        return false;
      }
    }

    return false;
  }

  static Future<bool> turnOffWifi() async {
    if (Platform.isAndroid) {
      try {
        await _channel.invokeMethod("turnOffWifi");
        return true;
      } catch (e) {
        return false;
      }
    }

    return false;
  }
}
