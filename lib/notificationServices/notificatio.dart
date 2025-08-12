import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationServices{
  FirebaseMessaging messaging= FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();

  void requestForNotification() async{
    NotificationSettings settings=await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('Authoreised');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('Provisional');
    }else{
      Get.snackbar('Denied !!', 'Permission denied');
      Future.delayed(Duration(seconds: 2),(){
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
    }
  }

  // geting device token
  Future<String> getDevicetoken() async{
    // ignore: unused_local_variable
    NotificationSettings settings= await messaging.requestPermission(
      sound: true,
      alert: true,
      badge: true,
    );
    String? token= await messaging.getToken();
    print('Token =======>>>> $token');
    return token!;
  }
  
    // initialization of notification
  void initnotification(BuildContext context, RemoteMessage msg) async{
    var androidInitSetting= AndroidInitializationSettings("@mipmap/ic_launcher");

    var iosInitSetting= DarwinInitializationSettings();

    var initializationSetting=InitializationSettings(
      android: androidInitSetting,
      iOS: iosInitSetting,
    );  
    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,onDidReceiveNotificationResponse: (details) {},);
  }
}