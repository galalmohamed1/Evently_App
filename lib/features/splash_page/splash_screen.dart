import 'package:animate_do/animate_do.dart';
import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/onborder/firstscreen.dart';
import 'package:flutter/material.dart';

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
      () {
        Navigator.pushNamed(context, FirstScreen.routeName);
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
