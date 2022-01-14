import 'package:bitirme_proje/soru_secenek.dart';
import 'package:bitirme_proje/sorudao.dart';
import 'package:flutter/material.dart';
import 'package:bitirme_proje/kelimeler.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  var listele3 = <DogruKontroll>[];
  var listele3_1 = <DogruKontroll>[];
  var listele4 = <YanlisKontroll>[];
  var listele4_1 = <YanlisKontroll>[];
  late YanlisKontroll yanlisnesne;
  late DogruKontroll dogrunesne;
  late int id;
  late int id2;
  int sayac = 0;
  int sayac2 = 0;
  int i = 0;
  int j = 0;
  @override
  void initState() {
    super.initState();
    dogrubilgial();
    yanlisbilgial();
  }

  Future<void> dogrubilgial() async {
    listele3 = await Kelimelerdao().dogruoku();
    dogrubilgiYukle();
  }

  Future<void> yanlisbilgial() async {
    listele4 = await Kelimelerdao().yanlisoku();
    yanlisbilgiYukle();
  }

  Future<void> dogrubilgiYukle() async {
    dogrunesne = listele3[sayac];
    for (j = 0; j < listele3.length; j++) {
      listele3_1.add(listele3[sayac]);
    }
    id = listele3_1.elementAt(sayac).dogru_id;
    id = dogrunesne.dogru_id;

    setState(() {});
  }

  Future<void> yanlisbilgiYukle() async {
    yanlisnesne = listele4[sayac2];
    for (i = 0; i < listele4.length; i++) {
      listele4_1.add(listele4[sayac2]);
    }
    id2 = listele4_1.elementAt(sayac2).yanlis_id;
    id2 = yanlisnesne.yanlis_id;

    setState(() {});
  }

  void sayacc() {
    sayac++;
    if (sayac < listele3.length) {
      dogrubilgiYukle();
    } else {}
  }

  void sayacc2() {
    sayac2++;
    if (sayac2 < listele4.length) {
      yanlisbilgiYukle();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(
            "",
            style: TextStyle(
                fontSize: ekranGenisligi / 10, color: Colors.blueGrey.shade900),
          ),
          Text(
            "Başarı Oranı",
            style: TextStyle(
                fontSize: ekranGenisligi / 10, color: Colors.blueGrey.shade900),
          ),
          Text(
            "",
            style: TextStyle(
                fontSize: ekranGenisligi / 10, color: Colors.blueGrey.shade900),
          ),
          SizedBox(
            width: 250,
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                sayacc2();
              },
              style: ElevatedButton.styleFrom(primary: Colors.teal),
              child: Text("Doğru sayisi: " +
                  id.toString() +
                  "  Yanlış Sayisi: " +
                  id2.toString()),
            ),
          ),
          Text(
            "",
            style: TextStyle(fontSize: ekranGenisligi / 5),
          ),
          Padding(
            padding: EdgeInsets.all(ekranGenisligi / 40),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Kelimeler()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.white, width: 4),
                    )),
                child: Text(
                  'Kelimelerim',
                  style: TextStyle(fontSize: ekranGenisligi / 12),
                )),
          ),
        ],
      )),
    );
  }
}
