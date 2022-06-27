import 'package:flutter/material.dart';
import 'package:qr_reader/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR reader',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'mapa': (_) => const MapaPage(),
      },
    );
  }
}
