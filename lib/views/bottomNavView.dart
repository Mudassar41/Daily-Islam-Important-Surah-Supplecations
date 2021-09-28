// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controllers/bottomNavController.dart';
import 'package:islamic_app/utills/customColors.dart';

class BottomNavigationView extends StatelessWidget {
  BottomNaviController bottomNaviController = Get.put(BottomNaviController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Islam',
            style: TextStyle(
              color: CustomColors.blue,
              fontFamily: 'Patua',
              fontSize: 26,
            ),
          ),
        ),
        body: PageView(
          onPageChanged: bottomNaviController.onPageChanged,
          controller: bottomNaviController.pageController,
          children: bottomNaviController.widgetList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: CustomColors.orange,
          onTap: bottomNaviController.onItemTapped,
          currentIndex: bottomNaviController.selectedIndex.value,
          items: bottomNaviController.bottomList.map((e) {
            return BottomNavigationBarItem(
                icon: Icon(
                  e.iconData,
                  size: 20,
                ),
                label: e.title);
          }).toList(),
        ),
      );
    });
  }
}
