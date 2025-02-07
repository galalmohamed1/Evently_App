import 'dart:developer';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/features/Login/loginpage.dart';
import 'package:evently/features/Login/reset_password.dart';
import 'package:evently/features/Login/signup.dart';
import 'package:evently/features/add_cart/add_cart.dart';
import 'package:evently/features/layout/home_page/home_page.dart';
import 'package:evently/features/layout/page/pagescreen.dart';
import 'package:evently/features/onborder/firstscreen.dart';
import 'package:evently/features/onborder/onboard_screen.dart';
import 'package:evently/features/splash_page/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    log('Route: ${settings.name}');
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );

      case PagesRouteName.OnboardScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardScreen(),
          settings: settings,
        );

      case PagesRouteName.LoginPage:
        return MaterialPageRoute(
          builder: (context) =>    LoginPage(),
          settings: settings,
        );

      case PagesRouteName.SignUp:
        {
          return MaterialPageRoute(
            builder: (context) => const SignUp(),
            settings: settings,
          );
        }

      case PagesRouteName.ResetPassword:
        {
          return MaterialPageRoute(
            builder: (context) => const ResetPassword(),
            settings: settings,
          );
        }
      case PagesRouteName.HomePage:
        {
          return MaterialPageRoute(
            builder: (context) => const HomePage(),
            settings: settings,
          );
        }
      case PagesRouteName.FirstScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const FirstScreen(),
            settings: settings,
          );

        }
      case PagesRouteName.PageScreen:
        {
          return MaterialPageRoute(
            builder: (context) =>   PageScreen(),
            settings: settings,
          );

        }
      case PagesRouteName.Add_Card:
        {
          return MaterialPageRoute(
            builder: (context) => const  Add_Card(),
            settings: settings,
          );

        }
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}