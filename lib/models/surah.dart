class Surah {
  late String surahNameArb;
  late String surahNameEng;
  late List<String> surahTxt;
  Surah(
      {required this.surahNameArb,
      required this.surahNameEng,
      required this.surahTxt});
  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        surahNameArb: json["surahNameArb"],
        surahNameEng: json["surahNameEng"],
        surahTxt: List<String>.from(json["surahTxt"].map((x) => x)),
      );
}
