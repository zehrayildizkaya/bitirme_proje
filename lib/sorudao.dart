import 'package:bitirme_proje/soru_secenek.dart';
import 'package:bitirme_proje/database_helper.dart';

class Kelimelerdao {
  Future<List<Kolayy>> tumKelimeler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kolay");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kolayy(satir["soru_id"], satir["ingilizce"], satir["secenek_1"],
          satir["secenek_2"], satir["dogru"]);
    });
  }

  Future<List<Ortaa>> tumKelimeler2() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM orta");

    return List.generate(maps.length, (i) {
      var satir2 = maps[i];
      return Ortaa(satir2["soru_id2"], satir2["ingilizce2"],
          satir2["secenek2_1"], satir2["secenek2_2"], satir2["dogru2"]);
    });
  }

  Future<List<Zorr>> tumKelimeler3() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM zor");

    return List.generate(maps.length, (i) {
      var satir3 = maps[i];
      return Zorr(satir3["soru_id3"], satir3["ingilizce3"],
          satir3["secenek3_1"], satir3["secenek3_2"], satir3["dogru3"]);
    });
  }

  Future<List<Kelimelerr>> tumKelimeler4() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kelime");

    return List.generate(maps.length, (i) {
      var satir4 = maps[i];
      return Kelimelerr(satir4["kelime_number"], satir4["ingilizce4"],
          satir4["secenek4_1"], satir4["secenek4_2"], satir4["dogru4"]);
    });
  }

  Future<List<DogruKontroll>> dogruoku() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM dogrukontrol");

    return List.generate(maps.length, (i) {
      var satir5 = maps[i];
      return DogruKontroll(satir5["dogru_id"], satir5["dogrucevap"]);
    });
  }

  Future<List<YanlisKontroll>> yanlisoku() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM yanliskontrol");

    return List.generate(maps.length, (i) {
      var satir5 = maps[i];
      return YanlisKontroll(satir5["yanlis_id"], satir5["yanliscevap"]);
    });
  }

  Future<void> dogruEkle(int dogrucevap) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var dogrubilgi = Map<String, dynamic>();
    dogrubilgi["dogrucevap"] = dogrucevap;
    await db.insert("dogrukontrol", dogrubilgi);
  }

  Future<void> yanlisEkle(int yanliscevap) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yanlisbilgi = Map<String, dynamic>();
    yanlisbilgi["yanliscevap"] = yanliscevap;
    await db.insert("yanliskontrol", yanlisbilgi);
  }
}
