// Flutter Imports
import 'package:flutter/material.dart';

// Screen Imports
import 'package:projekuaspbp/screens/landing_page.dart';
import 'package:projekuaspbp/screens/beranda.dart';

// Widget Imports
//--

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TitikLapar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFE6ECD9),
          primary: Color.fromARGB(255, 103, 143, 17),
          secondary: Color(0xFF176D70),
        ),
        useMaterial3: true,
      ),
      home: Beranda(),
    );
  }
}