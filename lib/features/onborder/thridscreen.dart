import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ThridScreen extends StatelessWidget {
  const ThridScreen({super.key});

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
              height: 35,
            ),
            Image(
              image: AssetImage(AppAssets.Splash3),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Effortless Event Planning",
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
              "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
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
