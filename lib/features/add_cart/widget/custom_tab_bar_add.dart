import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTabBarAdd extends StatelessWidget {
  final String text;
  final String text_icon;
  final bool isSelected;

  const CustomTabBarAdd(
      {super.key,
      required this.text,
      required this.text_icon,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.purpel : AppColor.white,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(color: AppColor.purpel),
      ),
      child: Tab(
        child: Row(
          children: [
            ImageIcon(
              AssetImage(text_icon),
              color: isSelected ? AppColor.white : AppColor.purpel,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: isSelected ? AppColor.white : AppColor.purpel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
