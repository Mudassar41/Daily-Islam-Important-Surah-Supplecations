// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:islamic_app/models/surah.dart';
import 'package:islamic_app/services/jsonParsing.dart';

class SurahController extends GetxController {
  var surahList = <Surah>[].obs;
  var isLoading = false.obs;
  LocalJsonParsing localJsonParsing = LocalJsonParsing();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    isLoading(true);
    var list = await localJsonParsing.getSurahData();
    surahList(list);
    isLoading(false);
  }
}
