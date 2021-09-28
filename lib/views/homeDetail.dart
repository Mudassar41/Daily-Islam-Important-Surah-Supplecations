// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islamic_app/models/eventsRecite.dart';
import 'package:islamic_app/utills/customColors.dart';

class HomeDetail extends StatelessWidget {
  final EventsRecite data;

  const HomeDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِيمِ',
                      style: TextStyle(
                          fontSize: (hieght / 100) * 4.5,
                          color: CustomColors.orange,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Patua'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    data.subTitle,
                    style: TextStyle(
                        fontSize: (hieght / 100) * 4,
                        color: CustomColors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Patua'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.text,
                    style: TextStyle(
                        fontSize: (hieght / 100) * 3.5,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'mirza'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
