// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/controllers/homeController.dart';
import 'package:islamic_app/controllers/surahController.dart';
import 'package:islamic_app/utills/customColors.dart';
import 'package:islamic_app/views/surahDetail.dart';

class SurahView extends StatelessWidget {
  SurahController surahController = Get.put(SurahController());
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Recite Important Surah',
            style: TextStyle(fontFamily: 'Patua', fontSize: 22),
          ),
        ),
        Obx(() {
          if (surahController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: surahController.surahList.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Get.to(SurahDetail(surahDetail:surahController.surahList[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            homeController.colorList[homeController.getIndex(
                                index, homeController.colorList)],
                            CustomColors.offWhite
                          ], begin: Alignment.topLeft, end: Alignment.topRight),
                        ),
                        height: (hieght / 100) * 15,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                surahController.surahList[index].surahNameArb,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Patua',
                                  fontSize: (hieght / 100) * 2.5,
                                ),
                              ),
                              Text(
                                surahController.surahList[index].surahNameEng,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: 'Patua',
                                  fontSize: (hieght / 100) * 2.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ],
    );
  }
}
