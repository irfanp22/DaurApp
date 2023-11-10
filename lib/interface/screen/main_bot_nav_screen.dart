import 'package:daur_app/interface/screen/account_screen.dart';
import 'package:daur_app/interface/screen/history_screen.dart';
import 'package:daur_app/interface/screen/home_screen.dart';
import 'package:daur_app/interface/screen/trash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daur_app/interface/stateholders/main_bot_nav_controller.dart';
import 'package:daur_app/interface/utils/app_color.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const TrashScreen(),
    const HistoryScreen(),
    const AccountScreen()
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: screens[controller.currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentSelectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColor.primaryColor,
          showSelectedLabels: true,
          type: BottomNavigationBarType.shifting,
          elevation: 4,
          onTap: controller.onChanged,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
                tooltip: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.trash), label: "Trash"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.doc_text), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: "Account"),
          ],
        ),
      );
    });
  }
}
