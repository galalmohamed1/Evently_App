import 'package:animate_do/animate_do.dart';
import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static final Duration _duration = Duration(milliseconds: 1750);
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () async{
        final  prefs = await SharedPreferences.getInstance();
        final onboarding=prefs.getBool("onboarding")??false;
        navigatorKey.currentState!.pushReplacementNamed(onboarding?PagesRouteName.LoginPage:PagesRouteName.FirstScreen,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Stack(
          children: [
            ZoomIn(
              duration: SplashScreen._duration,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: 136,
                    child: Image(
                      image: AssetImage(AppAssets.Logo_Splach),
                    )),
              ),
            ),
            FadeInUp(
              duration: SplashScreen._duration,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: 214,
                    child: Image(
                      image: AssetImage(AppAssets.Logo_Route),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
