import 'package:evently/core/theme/app_color.dart';
import 'package:evently/models/event_category.dart';
import 'package:flutter/material.dart';

class CustomTabBarAdd extends StatelessWidget {

  final EventCategory eventCategory;
  final bool isSelected;


  const CustomTabBarAdd({
    super.key,
    required this.eventCategory,
    required this.isSelected,
  });


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
      child: Row(
        children: [
          Icon(
            eventCategory.eventCategoryIcon,
            color: isSelected ? AppColor.white : AppColor.purpel,
        size: 20,

          ),
          SizedBox(
            width: 5,
          ),
          Text(
            eventCategory.eventCategoryName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: isSelected ? AppColor.white : AppColor.purpel,
            ),
          ),
        ],
      ),
    );
  }
}
