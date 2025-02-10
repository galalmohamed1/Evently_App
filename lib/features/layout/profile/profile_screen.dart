import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/extensions/context_extension.dart';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/Login/loginpage.dart';
import 'package:evently/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Container(
            height: 225,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.purpel,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 124,
                  height: 124,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                      color: Colors.white),
                  child: Image(
                    image: AssetImage(AppAssets.image_profile),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Galal Mohamed",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "galalmohamed.route@gmail.com",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Language",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Arabic",
                            style: TextStyle(
                                color: AppColor.purpel,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.purpel,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColor.white),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          side: BorderSide(color: AppColor.purpel),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Theme",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Light",
                            style: TextStyle(
                                color: AppColor.purpel,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: AppColor.purpel,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.white),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(color: AppColor.purpel),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 16))),
                  ),
                  Spacer(),
                  ElevatedButton(

                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      navigatorKey.currentState!.pushNamedAndRemoveUntil(PagesRouteName.LoginPage, (route) => false,);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(
                            Icons.exit_to_app_rounded,
                            color: AppColor.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColor.red),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
