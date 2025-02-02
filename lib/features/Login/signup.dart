import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/Login/loginpage.dart';
import 'package:evently/features/Login/widget/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SignUp extends StatefulWidget {
  static String routeName = "SignUp";

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _isPassword;
  var _isRePassword;
  bool isSwitchOn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPassword = true;
    _isRePassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(AppAssets.Logo_Splach),
                width: 136,
                height: 186,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child:
                    Text_Feild(nameIcon: Icon(Icons.person), texthint: "Name"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:
                    Text_Feild(nameIcon: Icon(Icons.email), texthint: "Email"),
              ),
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isRePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColor.gray),
                    ),
                    hintText: "Re Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isRePassword = !_isRePassword;
                        });
                      },
                      icon: _isRePassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      color: AppColor.gray,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      LoginPage.routeName,
                    );
                  },
                  child: SizedBox(
                    width: 350,
                    child: Text(
                      "Sign Up",
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
                    "Already Have Account ?",
                    style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Text(
                      "Login",
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
