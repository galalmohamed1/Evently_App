import 'package:evently/core/extensions/context_extension.dart';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/Login/loginpage.dart';
import 'package:evently/features/onborder/fourscreen.dart';
import 'package:evently/features/onborder/secondscreen.dart';
import 'package:evently/features/onborder/thridscreen.dart';
import 'package:evently/features/onborder/widget/animation_controller.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  static const String routeName = "OnboardScreen";

  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: [
                SecondScreen(),
                ThridScreen(),
                FourScreen(),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: index == 0
                          ? Border.all(color: Colors.transparent)
                          : Border.all(color: AppColor.purpel),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: index == 0
                        ? Text("")
                        : IconButton(
                            onPressed: () {
                              _controller.animateToPage(index - 1,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.linear);
                            },
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: AppColor.purpel,
                            )),
                  ),
                ),
                Spacer(),
                AnimationControl(active: index == 0),
                SizedBox(
                  width: 10,
                ),
                AnimationControl(active: index == 1),
                SizedBox(
                  width: 10,
                ),
                AnimationControl(active: index == 2),
                SizedBox(
                  width: 10,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: AppColor.purpel),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                        onPressed: () {
                          index == 2
                              ? context.goToNamed(PagesRouteName.LoginPage)
                              : _controller.animateToPage(index + 1,
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.linear);
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColor.purpel,
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
