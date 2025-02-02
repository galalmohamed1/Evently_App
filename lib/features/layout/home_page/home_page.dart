import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/layout/page/widget/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = "HomePage";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int current = 0;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: DefaultTabController(
        length: 10,
        child: Column(
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
                    TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: Colors.transparent,
                        labelPadding: EdgeInsets.symmetric(horizontal: 5),
                        onTap: (value) {
                          current==value;
                        },
                        tabs: [
                          CustomTabBarAdd(
                              text: "All",
                              text_icon: AppAssets.icon_All,
                              isSelected: true,
                          ),
                          CustomTabBarAdd(
                              text: "Sport",
                              text_icon: AppAssets.icon_bike,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Birthday",
                              text_icon: AppAssets.icon_cake,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Book Club",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Meeting",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Eating",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Work Shop",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Holiday",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Gaming",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                          CustomTabBarAdd(
                              text: "Exhibition",
                              text_icon: AppAssets.icon_book,
                              isSelected: false,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
