import 'package:college_notes/firebase_options.dart';
import 'package:college_notes/screens/spalsh/splashScreen.dart';
import 'package:college_notes/theme/themeData.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lighttheme,
      home: Splashscreen());
  }
}

// d0tfwlpnR9qhUlehyNZKeE:APA91bHxet6lYhCnC92A4CyDFOiqUnEEuGTfum3IFJkfwwujJ2tMylsju6JVSYkNdVj9zSaGVIthdrtCxc-GEMzvswQSI8Tme_WEwulF47B8pv5H0tk9ndc