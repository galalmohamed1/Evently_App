import 'package:evently/core/app_assets/app_assets.dart';
import 'package:evently/core/extensions/context_extension.dart';
import 'package:evently/core/routes/app_routes_name.dart';
import 'package:evently/core/theme/app_color.dart';
import 'package:evently/features/add_cart/add_cart.dart';
import 'package:evently/features/layout/home_page/home_page.dart';
import 'package:evently/features/layout/love/love_screen.dart';
import 'package:evently/features/layout/map/map_screen.dart';
import 'package:evently/features/layout/page/widget/custom_nav_bar_item.dart';
import 'package:evently/features/layout/profile/profile_screen.dart';
import 'package:evently/main.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatefulWidget {

  PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  int selectindex = 0;
  List<Widget> tap = [
    const HomePage(),
    const MapScreen(),
    const SizedBox(),
    const LoveScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: tap[selectindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: AppColor.white,
            width: 5,
          ),
        ),
        backgroundColor: AppColor.purpel,
        onPressed: () => navigatorKey.currentState!.pushNamed(PagesRouteName.Add_Card),
        child: Icon(
          Icons.add,
          size: 30,
          color: AppColor.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onBtnNavTapped,
        backgroundColor: AppColor.purpel,
        fixedColor: AppColor.white,
        showUnselectedLabels: true,
        currentIndex: selectindex,
        items: [
          BottomNavigationBarItem(
            icon: CustomNavBarItem(
              selectedindex: selectindex,
              iconPath: AppAssets.icon_home2,
              iconPath2: AppAssets.icon_home,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: "Map",
          ),
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: "Likes",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  _onBtnNavTapped(int index) {
    if (index == 2) return;
    selectindex = index;
    setState(() {});
  }
}
