import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/extensions/context_extension.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  static String routeName = "ResetPassword";

  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Center(
          child: Text("Forget Password"),
        ),
      ),
      body: Column(
        children: [
          Image(image: AssetImage(AppAssets.image_Reset_Password)),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: ElevatedButton(
              onPressed:() => context.back(),
              child: SizedBox(
                width: 350,
                child: Text(
                  "Reset Password",
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
          ),
        ],
      ),
    );
  }
}
