import 'package:evently/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class Text_Feild extends StatelessWidget {
  final String texthint;
  final Icon nameIcon;

  const Text_Feild({super.key, required this.texthint, required this.nameIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.gray),
        ),
        hintText: texthint,
        prefixIcon: nameIcon,
      ),
    );
  }
}
