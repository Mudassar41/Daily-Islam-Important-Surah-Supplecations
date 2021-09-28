// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islamic_app/models/surah.dart';
import 'package:islamic_app/utills/customColors.dart';

class SurahDetail extends StatelessWidget {
  final Surah surahDetail;

  const SurahDetail({Key? key, required this.surahDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                    surahDetail.surahNameArb,
                    style: TextStyle(
                        fontSize: (hieght / 100) * 4,
                        color: CustomColors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Patua'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      children: surahDetail.surahTxt.map((e) {
                        int indx = surahDetail.surahTxt.indexOf(e);
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              //   Icon(FontAwesomeIcons.borderStyle ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Text(
                                  '${e}',
                                  style: TextStyle(
                                      fontFamily: 'mirza',
                                      fontSize: (hieght / 100) * 4,
                                      letterSpacing: 2),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 2)
                                        //  borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                    child: Center(child: Text(' ${indx + 1}'))),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
