import 'package:flutter/material.dart';
import 'package:student_connection/pages/loginpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset("files/logoforweb.jpg"),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.scaleTransition,
        duration: 500,
      ),
    );
  }
}
