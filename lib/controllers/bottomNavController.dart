// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:islamic_app/models/bottomItems.dart';
import 'package:islamic_app/views/homeView.dart';
import 'package:islamic_app/views/surahView.dart';

class BottomNaviController extends GetxController {
  PageController pageController = PageController();
  var selectedIndex = 0.obs;
  var bottomList = [
    BottomItems(title: 'Home', iconData: FontAwesomeIcons.home),
    BottomItems(title: 'Surah', iconData: FontAwesomeIcons.book)
  ];

  var widgetList = [HomeView(), SurahView()];
  void onPageChanged(int index) {
    selectedIndex(index);
  }

  void onItemTapped(int index) {
    pageController.jumpToPage(index);
  }
}
