import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class FourScreen extends StatelessWidget {
  const FourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage(AppAssets.Logo_app),
              width: 159,
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Image(
              image: AssetImage(AppAssets.Splash4),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Connect with Friends & Share Moments",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColor.purpel,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
