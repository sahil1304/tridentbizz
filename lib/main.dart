import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:myflutterapp/show_bill_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventary Management',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/Logokk.png'),
        nextScreen:ShowBillScreen(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 4000,
        splashIconSize: 200.0,
      ),
    );
  }
}



