import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};
  MainApp({super.key}) {
    biodata['name'] = 'Raditya Hakim D';
    biodata['nim'] = 'A11.2021.13619';
    biodata['addr'] = 'Semarang, Pasadena';
    biodata['foto'] = 'raditya.png';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black38, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["foto"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.alternate_email, Colors.green[900]),
                btnContact(Icons.mark_email_read_rounded, Colors.blueAccent),
                btnContact(Icons.phone, Colors.deepPurple),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            textAttribute("NIM", biodata['nim'] ?? ''),
            textAttribute("Alamat", biodata['addr'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Colors.black38, 'Deskripsi')
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text("- $judul",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(":", style: TextStyle(fontSize: 18)),
        Text(teks, style: TextStyle(fontSize: 18))
      ],
    );
  }

  Expanded btnContact(IconData icon, var color) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Icon(Icons.alternate_email),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
