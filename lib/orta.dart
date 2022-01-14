import 'package:flutter/material.dart';
import 'package:bitirme_proje/soru_secenek.dart';
import 'package:bitirme_proje/sorudao.dart';

class Orta extends StatefulWidget {
  @override
  _OrtaState createState() => _OrtaState();
}

class _OrtaState extends State<Orta> {
  var liste = <Ortaa>[];
  var liste2 = <Ortaa>[];
  var listele = <DogruKontroll>[];
  var listele2 = <YanlisKontroll>[];
  late Ortaa ortanesne;
  late int soru_numara;
  String sorumuz = "";
  String secenek1 = "";
  String secenek2 = "";
  int dogrucevapp = 0;
  int yanliscevapp = 0;
  int sayac = 0;
  int i = 0;
  @override
  void initState() {
    super.initState();
    soruAl();
    dogrubilgial();
    yanlisbilgial();
  }

  Future<void> soruAl() async {
    liste = await Kelimelerdao().tumKelimeler2();
    soruYukle();
  }

  Future<void> dogrubilgial() async {
    listele = await Kelimelerdao().dogruoku();
  }

  Future<void> yanlisbilgial() async {
    listele2 = await Kelimelerdao().yanlisoku();
  }

  Future<void> soruYukle() async {
    ortanesne = liste[sayac];
    for (i = 0; i < liste.length; i++) {
      liste2.add(liste[sayac]);
    }
    soru_numara = liste2.elementAt(sayac).soru_id2;
    sorumuz = liste2.elementAt(sayac).ingilizce2;
    secenek2 = liste2.elementAt(sayac).secenek2_2;
    secenek1 = liste2.elementAt(sayac).secenek2_1;

    soru_numara = ortanesne.soru_id2;
    sorumuz =ortanesne.ingilizce2;
    secenek2 = ortanesne.secenek2_2;
    secenek1 = ortanesne.secenek2_1;

    setState(() {});
  }

  Future<void> dogruyuekle() async {
    await Kelimelerdao().dogruEkle(22);
  }

  Future<void> yanlisiekle() async {
    await Kelimelerdao().yanlisEkle(33);
  }

  void soru_sayac() {
    sayac++;
    if (sayac < liste.length) {
      soruYukle();
    } else {}
  }

  void kontrol() {
    if (ortanesne.dogru2 == 1) {
      dogruyuekle();
    } else {
      yanlisiekle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text("Orta Seviye Sorular",
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 55, child: Text("$dogrucevapp")),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(width: 3.0, color: Colors.indigo.shade900),
                      left:
                          BorderSide(width: 3.0, color: Colors.indigo.shade900),
                      bottom:
                          BorderSide(width: 3.0, color: Colors.indigo.shade900),
                      top: BorderSide(
                          width: 3.0, color: Colors.indigo.shade900))),
              width: 400,
              height: 200,
              child: Text(sorumuz,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.indigo.shade900,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center),
            ),
            Container(height: 70),
            Container(
              width: 350,
              height: 80,
              child: ElevatedButton(
                child: Text(secenek1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15)),
                onPressed: () {
                  soru_sayac();
                  kontrol();
                },
              ),
            ),
            Container(height: 40),
            SizedBox(
              width: 350,
              height: 80,
              child: ElevatedButton(
                child: Text(secenek2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15)),
                onPressed: () {
                  soru_sayac();
                  kontrol();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
