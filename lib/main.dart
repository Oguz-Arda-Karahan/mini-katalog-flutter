import 'package:flutter/material.dart';
import 'sayfalar/ana_sayfa.dart';

void main() {
  runApp(MiniKatalogUygulamasi());
}

class MiniKatalogUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'San Francisco',
      ),
      home: AnaSayfa(),
    );
  }
}
