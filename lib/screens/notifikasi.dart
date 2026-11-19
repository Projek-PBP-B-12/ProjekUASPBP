// Flutter Imports
import 'package:flutter/material.dart';

// Screen Imports
//--

// Widget Imports
import 'package:projekuaspbp/widgets/left_drawer.dart';
import 'package:projekuaspbp/widgets/main_app_bar.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Body, SnackBar).
    return Scaffold(
      appBar: MainAppBar(title: "Notifikasi"),
      drawer: LeftDrawer(),
      body: Placeholder()
    );
  }

}