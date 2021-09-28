import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/views/bottomNavView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: 'Patua',
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationView(),
    );
  }
}
