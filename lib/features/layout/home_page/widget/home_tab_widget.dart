import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/models/event_category.dart';
import 'package:flutter/material.dart';

class HomeTabWidget extends StatelessWidget {
  final EventCategory eventCategory;
  final bool isSelected;
  
  const HomeTabWidget({
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
        color: isSelected ? AppColor.white : AppColor.purpel,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(color: AppColor.white),
      ),
      child: Row(
        children: [
          Icon(eventCategory.eventCategoryIcon,
            color: isSelected ? AppColor.purpel : AppColor.white,
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
              color: isSelected ? AppColor.purpel : AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
