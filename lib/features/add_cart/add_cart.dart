import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/add_cart/widget/custom_tab_bar_add.dart';
import 'package:flutter/material.dart';

class Add_Card extends StatelessWidget {
  static String routeName = "Add_Card";

  const Add_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Center(
            child: Text(
              "Create Event",
              style: TextStyle(
                  color: AppColor.purpel, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 361,
                height: 203,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.image_sport),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16)),
              ),
              SizedBox(
                height: 5,
              ),
              TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.transparent,
                  tabs: [
                    CustomTabBarAdd(
                        text: "Sport",
                        text_icon: AppAssets.icon_bike,
                        isSelected: true),
                    CustomTabBarAdd(
                        text: "Birthday",
                        text_icon: AppAssets.icon_cake,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Book Club",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Meeting",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Eating",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Work Shop",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Holiday",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Gaming",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                    CustomTabBarAdd(
                        text: "Exhibition",
                        text_icon: AppAssets.icon_book,
                        isSelected: false),
                  ]),
              SizedBox(
                height: 10,
              ),
              Text(
                "Title",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.gray),
                  ),
                  hintText: "Event Title",
                  prefixIcon:
                      Icon(Icons.edit_note_outlined, color: AppColor.gray),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.gray),
                  ),
                  hintText: "Event Description",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Event Date",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.purpel),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(Icons.access_time_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Event Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Choose Time",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.purpel),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "Location",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.purpel,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.my_location_outlined,
                        color: AppColor.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Choose Event Location",
                      style: TextStyle(
                          color: AppColor.purpel,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.purpel,
                    ),
                  ],
                ),
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                  backgroundColor: MaterialStatePropertyAll(AppColor.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: AppColor.purpel)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.popAndPushNamed(context, LoginPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Event",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColor.purpel),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
