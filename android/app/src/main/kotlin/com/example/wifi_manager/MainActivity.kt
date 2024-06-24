package com.example.wifi_manager

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.net.wifi.WifiManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.plugin.common.MethodCall

class MainActivity: FlutterActivity(){
    private val CHANNEL = "WIFI_MANAGER_CHANNEL"
    private val TURN_ON_WIFI_METHOD = "turnOnWifi"
    private val TURN_OFF_WIFI_METHOD = "turnOffWifi"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            handleCall(call,result)
        }
    }
    private fun handleCall(call:MethodCall, result:MethodChannel.Result){
        if(call.method == TURN_ON_WIFI_METHOD){
            turnOnWifi(result)
        }else if(call.method == TURN_OFF_WIFI_METHOD){
            turnOffWifi(result)
        }else{
            result.notImplemented();
        }
    }

    private fun turnOnWifi(result: MethodChannel.Result){
        if(VERSION.SDK_INT >= VERSION_CODES.Q){
            startActivity(Intent(WifiManager.ACTION_PICK_WIFI_NETWORK))
            result.success(null)
            return;
        }

        var wifi = applicationContext.getSystemService(WIFI_SERVICE) as WifiManager
        wifi.setWifiEnabled(true);
        result.success(null)
    }

    private fun turnOffWifi(result: MethodChannel.Result){
        if(VERSION.SDK_INT >= VERSION_CODES.Q){
            startActivity(Intent(WifiManager.ACTION_PICK_WIFI_NETWORK))
            result.success(null)
            return;
        }
        var wifi = applicationContext.getSystemService(WIFI_SERVICE) as WifiManager
        wifi.setWifiEnabled(false);
        result.success(null)
    }
}
