// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_app/models/eventsRecite.dart';
import 'package:islamic_app/utills/customColors.dart';

class HomeController extends GetxController {
  dynamic today;
  late DateTime now;
  var eventRecites = [
    EventsRecite(
        title: 'Kalima Shahadah',
        subTitle: 'کلمہ شہادت',
        text:
            'اشْهَدُ انْ لّآ اِلهَ اِلَّا اللّهُ وَحْدَه لَا شَرِيْكَ لَه، وَ اَشْهَدُ اَنَّ مُحَمَّدً اعَبْدُهوَرَسُولُه'),
    EventsRecite(
        title: 'Iman E Mufassil',
        subTitle: 'إيمان مفصل',
        text:
            'امَنْتُ بِاللهِ وَمَلئِكَتِه وَكُتُبِه وَرَسُوْلِه وَالْيَوْمِ الْاخِرِ وَالْقَدْرِ خَيْرِه وَشَرِّه مِنَ اللهِ تَعَالى وَالْبَعْثِ بَعْدَالْمَوْتِ'),
    EventsRecite(
        title: 'Iman E Mujmal',
        subTitle: 'إيمان مجمل',
        text:
            'امَنْتُ بِاللهِ كَمَا هُوَ بِاَسْمَائِه وَصِفَاتِه وَقَبِلْتُ جَمِيْعَ اَحْكَامِه وَاَرْكَانِه'),
    EventsRecite(
        title: 'Ayat ul Kursi',
        subTitle: 'آيَة الْكُرْسِي',
        text:
            'ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلۡحَىُّ ٱلۡقَيُّومُ‌ۚ لَا تَأۡخُذُهُ ۥ سِنَةٌ۬ وَلَا نَوۡمٌ۬‌ۚ لَّهُ ۥ مَا فِى ٱلسَّمَـٰوَٲتِ وَمَا فِى ٱلۡأَرۡضِ‌ۗ مَن ذَا ٱلَّذِى يَشۡفَعُ عِندَهُ ۥۤ إِلَّا بِإِذۡنِهِۦ‌ۚ يَعۡلَمُ مَا بَيۡنَ أَيۡدِيهِمۡ وَمَا خَلۡفَهُمۡ‌ۖ وَلَا يُحِيطُونَ بِشَىۡءٍ۬ مِّنۡ عِلۡمِهِۦۤ إِلَّا بِمَا شَآءَ‌ۚ وَسِعَ كُرۡسِيُّهُ ٱلسَّمَـٰوَٲتِ وَٱلۡأَرۡضَ‌ۖ وَلَا يَـُٔودُهُ ۥ حِفۡظُهُمَا‌ۚ وَهُوَ ٱلۡعَلِىُّ ٱلۡعَظِيمُ '),
    EventsRecite(
        title: 'DUA E QUNOOT',
        subTitle: 'دعا قنوت',
        text:
            'اَللَّهُمَّ إنا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنُؤْمِنُ بِكَ وَنَتَوَكَّلُ عَلَيْكَ وَنُثْنِئْ عَلَيْكَ الخَيْرَ وَنَشْكُرُكَ وَلَا نَكْفُرُكَ وَنَخْلَعُ وَنَتْرُكُ مَنْ ئَّفْجُرُكَ اَللَّهُمَّ إِيَّاكَ نَعْبُدُ وَلَكَ نُصَلِّئ وَنَسْجُدُ وَإِلَيْكَ نَسْعأئ وَنَحْفِدُ وَنَرْجُو رَحْمَتَكَ وَنَخْشآئ عَذَابَكَ إِنَّ عَذَابَكَ بِالكُفَّارِ مُلْحَقٌ')
  ];

  var namazJanaza = [
    EventsRecite(
        title: 'Mature Person',
        subTitle: 'بالغ شخص',
        text:
            'اللَّهُمَّ اغْفِرْ لِحَيِّنَا وَمَيِّتِنَا وَشَاهِدِنَا وَغَائِبِنَا وَصَغِيرِنَا وَكَبِيرِنَا وَذَكَرِنَا وَأُنْثَانَا اللَّهُمَّ مَنْ أَحْيَيْتَهُ مِنَّا فَأَحْيِهِ عَلَى الإِسْلاَمِ وَمَنْ تَوَفَّيْتَهُ مِنَّا فَتَوَفَّهُ عَلَى الإِيمَانِ'),
    EventsRecite(
        title: 'Male child',
        subTitle: 'نابالغ مرد',
        text:
            'اَللَّھُمَّ ج٘عَل٘ہُ لَناَ فَرَ طاً وَّ ج٘عَل٘ہُ لََنآَ اَج٘راً وَّ ذُخ٘راًوَّ ج٘عَل٘ہُ لَناَ شَا فِعاً وَّ مُشَف٘عاً ۰'),
    EventsRecite(
        title: 'Female child',
        subTitle: 'نابالغ عورت',
        text:
            'اَللَّھُمَّ ج٘عَل٘ہَ لَناَ فَرَ طاً وَّ ج٘عَل٘ہَ لََنآَ اَج٘راً وَّ ذُخ٘راًوَّ ج٘عَل٘ہَ لَناَ شَا فِعتاً وَّ مُشَفَّعَتاً ۰')
  ];

  var colorList = [
    CustomColors.blue,
    CustomColors.orange,
    // CustomColors.green,
    CustomColors.grey
  ];

  @override
  void onInit() {
    super.onInit();
    today = new HijriCalendar.now();
    now = new DateTime.now();
  }

  int getIndex(int index, List<Color> colors) {
    return index % colors.length;
  }
}
