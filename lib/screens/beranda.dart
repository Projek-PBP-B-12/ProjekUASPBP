// Flutter Imports
import 'package:flutter/material.dart';

// Screen Imports
//--

// Widget Imports
import 'package:projekuaspbp/widgets/left_drawer.dart';
import 'package:projekuaspbp/widgets/main_app_bar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Body, SnackBar).
    return Scaffold(
      appBar: MainAppBar(title: "TitikLapar"),
      drawer: LeftDrawer(),
      body: Placeholder()
    );
  }

}