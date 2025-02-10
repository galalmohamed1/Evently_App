import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/services/firebase_firestore_service.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/layout/home_page/widget/home_tab_widget.dart';
import 'package:evently/features/layout/love/widget/cart_list.dart';
import 'package:evently/models/event_category.dart';
import 'package:evently/models/event_data_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTap = 0;
  List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "All",
      eventCategoryIcon: Icons.explore_sharp,
      eventCategoryImg: "assets/images/category/Sport.png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/category/Sport.png",
    ),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/category/Birthday.png",
    ),
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/category/Book Club.png",
    ),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/category/Meeting.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/category/Holiday.png"),
    EventCategory(
        eventCategoryName: "Gaming",
        eventCategoryIcon: Icons.games_outlined,
        eventCategoryImg: "assets/images/category/Gaming.png",
    ),
    EventCategory(
        eventCategoryName: "Eating",
        eventCategoryIcon: Icons.set_meal_outlined,
        eventCategoryImg: "assets/images/category/Eating.png",
    ),
    EventCategory(
      eventCategoryName: "Work Shop",
      eventCategoryIcon: Icons.work_outlined,
      eventCategoryImg: "assets/images/category/Work Shop.png",
    ),
    EventCategory(
        eventCategoryName: "Exhibition",
        eventCategoryIcon: Icons.water_drop_rounded,
        eventCategoryImg: "assets/images/category/Exhibition.png",
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.purpel,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Galal Mohamed",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.wb_sunny_outlined,
                                color: AppColor.white,
                                size: 30,
                              )),
                          Container(
                            height: 35,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Text(
                              "EN",
                              style: TextStyle(
                                  color: AppColor.purpel,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage(AppAssets.icon_Map_Pin),
                        color: AppColor.white,
                        size: 30,
                      ),
                      Text(
                        "Cairo , Egypt",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: DefaultTabController(
                      length: 10,
                      child: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          unselectedLabelColor: Colors.transparent,
                          labelPadding: EdgeInsets.symmetric(horizontal: 5),
                          indicator: const BoxDecoration(),
                          onTap: (value) {
                            setState(() {
                              selectedTap=value;
                            },);
                          },
                          tabs:eventCategories.map(
                                (element) {
                              return HomeTabWidget(
                                eventCategory: element,
                                isSelected:
                                selectedTap == eventCategories.indexOf(element),
                              );
                            },
                          ).toList()),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          StreamBuilder(
            stream: FirebaseFireStoreService.getStreamData(
              eventCategories[selectedTap].eventCategoryName,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text(
                      "Something went wrong",
                    ),
                    const SizedBox(),
                    IconButton(
                      onPressed: () {},
                      icon:  Icon(
                        Icons.refresh_outlined,
                        color: AppColor.purpel,
                      ),
                    )
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return  Center(
                  child: CircularProgressIndicator(
                    color: AppColor.purpel,
                  ),
                );
              }

              List<EventDataModel> eventDataList = snapshot.data!.docs.map(
                    (element) {
                  return element.data();
                },
              ).toList();

              return eventDataList.isNotEmpty
                  ? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) => Cart_Of_List(
                  eventDataModel: eventDataList[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: eventDataList.length,
              )
                  : Text(
                "No Event Created Yet..!",
                // style: theme.textTheme.titleLarge,
              );
            },
          ),

        ],
      ),
    );
  }
}
