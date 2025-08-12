import 'dart:async';
import 'package:college_notes/notificationServices/fcmServices.dart';
import 'package:college_notes/notificationServices/notificatio.dart';
import 'package:college_notes/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? timer;
  NotificationServices notification =NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer(Duration(seconds: 4), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUser();
      notification.requestForNotification();
      notification.getDevicetoken();
      FcmServices.firebaseinit();
    });
    });
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset('assets/images/splash.json'),
      )),
    );
  }

  void checkUser(){
    final user=FirebaseAuth.instance.currentUser;
    if(user==null){
      goto.goLoginScreen();
    }else{
      goto.goHomePage();
    }
  }
}
