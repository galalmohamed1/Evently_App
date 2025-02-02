import 'package:evently/features/Login/loginpage.dart';
import 'package:evently/features/Login/reset_password.dart';
import 'package:evently/features/Login/signup.dart';
import 'package:evently/features/add_cart/add_cart.dart';
import 'package:evently/features/layout/page/pagescreen.dart';
import 'package:evently/features/onborder/firstscreen.dart';
import 'package:evently/features/onborder/onboard_screen.dart';
import 'package:evently/features/splash_page/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evently',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        OnboardScreen.routeName: (_) => OnboardScreen(),
        FirstScreen.routeName: (_) => FirstScreen(),
        LoginPage.routeName: (_) => LoginPage(),
        SignUp.routeName: (_) => SignUp(),
        ResetPassword.routeName: (_) => ResetPassword(),
        PageScreen.routeName: (_) => PageScreen(),
        Add_Card.routeName: (_) => Add_Card(),
      },
    );
  }
}
