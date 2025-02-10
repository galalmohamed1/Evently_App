import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/services/firebase_firestore_service.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/layout/love/widget/cart_list.dart';
import 'package:evently/models/event_data_models.dart';
import 'package:flutter/material.dart';

class LoveScreen extends StatelessWidget {

  const LoveScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: TextFormField(
                onTap: () {},
                decoration: InputDecoration(
                  fillColor: AppColor.white.withOpacity(0.5),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.purpel),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.purpel),
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColor.purpel,
                  ),
                  hintText: "Search for Event",
                  hintStyle: TextStyle(
                    color: AppColor.purpel,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // StreamBuilder(stream: FirebaseFireStoreService.getDataFormFirestore()., builder: builder)
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ListView.separated(
            //       itemBuilder: (context, index) => Cart_Of_List(
            //         eventDataModel: eventDataList[index],
            //       ),
            //       separatorBuilder: (context, index) =>
            //           Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            //       itemCount: eventDataModel.length,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
