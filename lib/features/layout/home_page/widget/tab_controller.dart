import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class TabWidgetController extends StatelessWidget {
  final String textName;
  final String imageIconName;

  const TabWidgetController(
      {super.key, required this.textName, required this.imageIconName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        // width: 90,
        height: 40,
        alignment: Alignment.center,

        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(imageIconName),
              color: AppColor.purpel,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              textName,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColor.purpel),
            ),
          ],
        ),
      ),
    );
  }
}
