// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:islamic_app/models/surah.dart';

class LocalJsonParsing {
  Future<List<Surah>> getSurahData() async {
    final data =
        await rootBundle.rootBundle.loadString('assets/jsonFiles/surah.json');
        
    final body = json.decode(data);
   
    List<Surah> surahList =
        body.map<Surah>((json) => Surah.fromJson(json)).toList();

    return surahList;
  }
}
