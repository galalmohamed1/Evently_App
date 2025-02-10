import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/extensions/context_extension.dart';
import 'package:evently/core/extensions/validations.dart';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/core/services/snack_bar_service.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/core/utlis/firebase-functions.dart';
import 'package:evently/core/widget/custom_text_field.dart';
import 'package:evently/features/Login/reset_password.dart';
import 'package:evently/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSwitchOn = false;
  final formKey=GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          child: Form(
            key: formKey,
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
                  CustomTextField(
                    controller: _emailController,
                    hint: "Email",
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "plz enter your email address";
                      }
                      if (!Validations.validateEmail(value)) {
                        return "plz enter a valid email address";
                      }
                      return null;
                    },
                    hintColor:  AppColor.gray,
                    prefixIcon: Icon(Icons.email,color: AppColor.gray,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    controller: _passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Password",
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "plz enter your password address";
                      }
                      return null;
                    },
                    hintColor:  AppColor.gray,
                    prefixIcon: Icon(Icons.lock,color: AppColor.gray,),

                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => navigatorKey.currentState!.pushNamed(PagesRouteName.ResetPassword),
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
                      if(formKey.currentState!.validate()){
                        FirebaseFunctions.login(
                            emailAddress: _emailController.text,
                            password:_passwordController.text,

                        ).then((value) {
                          EasyLoading.dismiss();
                          if(value==true){
                            navigatorKey.currentState!.pushNamedAndRemoveUntil(
                              PagesRouteName.PageScreen,
                                  (route) => false,);
                          }else{
                            SnackBarService.showErrorMessage('The password provided is too weak.');
                          }
                          },);
                      }

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
                      onPressed: () => context.goToNamed(PagesRouteName.SignUp),
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
      ),
    );
  }
}
