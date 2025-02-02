import 'package:flutter/material.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedindex;

  final String iconPath;
  final String iconPath2;

  const CustomNavBarItem({
    super.key,
    required this.selectedindex,
    required this.iconPath,
    required this.iconPath2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageIcon(
        selectedindex == 0 ? AssetImage(iconPath2) : AssetImage(iconPath),
      ),
    );
  }
}
