import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/models/event_data_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cart_Of_List extends StatelessWidget {
  final EventDataModel eventDataModel;
  const Cart_Of_List({super.key, required this.eventDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(eventDataModel.eventImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.purpel, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 43,
            margin: EdgeInsets.all(7.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              DateFormat("dd MMM").format(eventDataModel.eventDate),
              style: TextStyle(
                color: AppColor.purpel,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          Container(
            // width: double.infinity,
            // height: 40,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    eventDataModel.eventTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColor.black,
                    ),
                  ),
                ),
                Spacer(),
                ImageIcon(
                    AssetImage(AppAssets.icon_heart))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
