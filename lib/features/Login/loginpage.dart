import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/Login/reset_password.dart';
import 'package:evently/features/Login/signup.dart';
import 'package:evently/features/Login/widget/text_feild.dart';
import 'package:evently/features/layout/page/pagescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "LoginPage";

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isPassword;
  bool isSwitchOn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Image(
                image: AssetImage(AppAssets.Logo_Splach),
                width: 136,
                height: 186,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child:
                    Text_Feild(nameIcon: Icon(Icons.email), texthint: "Email"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColor.gray),
                    ),
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                      icon: _isPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      color: AppColor.gray,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ResetPassword.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.purpel,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PageScreen.routeName,
                    );
                  },
                  child: SizedBox(
                    width: 350,
                    child: Text(
                      "Login",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ?",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.purpel,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    color: AppColor.purpel,
                    endIndent: 10,
                    indent: 45,
                  )),
                  Text(
                    "Or",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.purpel),
                  ),
                  Expanded(
                      child: Divider(
                    color: AppColor.purpel,
                    endIndent: 45,
                    indent: 10,
                  )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, OnboardScreen.routeName,);
                  },
                  child: SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(AppAssets.icon_google),
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login With Google",
                          style: TextStyle(
                            color: AppColor.purpel,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: AppColor.purpel, width: 2)),
                    padding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlutterSwitch(
                width: 100.0,
                height: 40.0,
                toggleSize: 45.0,
                value: isSwitchOn,
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
                    isSwitchOn = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
