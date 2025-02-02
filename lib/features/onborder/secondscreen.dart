import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
              image: AssetImage(AppAssets.Splash2),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Find Events That Inspire You",
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
              "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
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
