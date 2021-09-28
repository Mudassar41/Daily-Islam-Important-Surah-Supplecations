// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controllers/homeController.dart';
import 'package:islamic_app/utills/appTexts.dart';
import 'package:islamic_app/utills/customColors.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/views/homeDetail.dart';

class HomeView extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'اِیَّاكَ نَعْبُدُ وَ اِیَّاكَ نَسْتَعِیْنُؕ',
                style: TextStyle(
                  fontFamily: 'Patua',
                  fontSize: (hieght / 100) * 2.8,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.orange,
                ),
              ),
            ),
            Card(
              // shadowColor: CustomColors.orange,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [CustomColors.blue, CustomColors.offWhite],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight),
                ),
                // color: CustomColors.blue,
                height: (hieght / 100) * 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${homeController.today.hYear} AH',
                                  style: TextStyle(
                                      fontSize: (hieght / 100) * 3,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.offWhite),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${homeController.today.hDay}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.offWhite),
                                    ),
                                    Text(
                                      '-${homeController.today.hMonth}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.offWhite),
                                    ),
                                    Text(
                                      ' ${homeController.today.toFormat("MMMM")}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.offWhite),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${DateFormat('EEEE').format(homeController.now)}',
                                  style: TextStyle(
                                      fontSize: (hieght / 100) * 3,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.orange),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${homeController.now.month}-${homeController.now.day}-${homeController.now.year}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.orange),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //         SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Important Recites",
                        style: TextStyle(
                            fontFamily: 'Patua',
                            color: Colors.black45,
                            fontSize: 16),
                      ),
                      Icon(FontAwesomeIcons.longArrowAltRight,
                          color: Colors.black45)
                    ],
                  )),
            ),
            Container(
              height: (hieght / 100) * 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Container(
                    height: (hieght / 100) * 20,
                    width: (hieght / 100) * 16,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: homeController.colorList[homeController.getIndex(
                          index, homeController.colorList)],
                      child: InkWell(
                        onTap: () {
                          Get.to(HomeDetail(
                              data: homeController.eventRecites[index]));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                homeController.eventRecites[index].title,
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Patua'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              homeController.eventRecites[index].subTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Patua',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: homeController.eventRecites.length,
              ),
            ),
            //         SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Namaz E Janaza",
                        style: TextStyle(
                            fontFamily: 'Patua',
                            color: Colors.black45,
                            fontSize: 16),
                      ),
                      Text(
                        "نماز جنازہ",
                        style: TextStyle(
                            fontFamily: 'Patua',
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  )),
            ),

            Row(
                children: homeController.namazJanaza.map((e) {
              int indx = homeController.namazJanaza.indexOf(e);
              return Expanded(
                flex: 1,
                child: Container(
                  height: (hieght / 100) * 20,
                  width: (hieght / 100) * 16,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: homeController.colorList[homeController.getIndex(
                        indx, homeController.colorList)],
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            HomeDetail(data: homeController.namazJanaza[indx]));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e.title,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Patua'),
                          ),
                          Text(
                            e.subTitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Patua',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
