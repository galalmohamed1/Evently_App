import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/onborder/onboard_screen.dart';
import 'package:evently/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FirstScreen extends StatefulWidget {

  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isSwitchOn_language = false;
  bool isSwitchOn_theme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppAssets.Logo_app),
              width: 159,
              height: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage(AppAssets.Splash1),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Personalize Your Experience",
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
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Language",
                  style: TextStyle(
                      color: AppColor.purpel,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Spacer(),
                FlutterSwitch(
                  width: 100.0,
                  height: 40.0,
                  toggleSize: 45.0,
                  value: isSwitchOn_language,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeToggleColor: AppColor.purpel,
                  inactiveToggleColor: AppColor.purpel,
                  activeSwitchBorder: Border.all(
                    color: AppColor.purpel,
                    width: 3.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: AppColor.purpel,
                    width: 3.0,
                  ),
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.white,
                  activeIcon: Image(
                    image: AssetImage(AppAssets.icon_EG),
                  ),
                  inactiveIcon: Image(
                    image: AssetImage(AppAssets.icon_LR),
                  ),
                  onToggle: (val) {
                    setState(() {
                      isSwitchOn_language = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Theme",
                  style: TextStyle(
                      color: AppColor.purpel,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                Spacer(),
                FlutterSwitch(
                  width: 100.0,
                  height: 40.0,
                  toggleSize: 45.0,
                  value: isSwitchOn_theme,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeToggleColor: AppColor.purpel,
                  inactiveToggleColor: AppColor.purpel,
                  activeSwitchBorder: Border.all(
                    color: AppColor.purpel,
                    width: 3.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: AppColor.purpel,
                    width: 3.0,
                  ),
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.white,
                  activeIcon: Icon(
                    Icons.mode_night,
                    color: AppColor.white,
                  ),
                  inactiveIcon: Icon(
                    Icons.light_mode_sharp,
                    color: AppColor.white,
                  ),
                  onToggle: (val) {
                    setState(() {
                      isSwitchOn_theme = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState!.pushNamed(PagesRouteName.OnboardScreen);
              },
              child: SizedBox(
                width: 350,
                child: Text(
                  "Let’s Start",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.purpel,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
