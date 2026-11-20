// Flutter Imports
import 'package:flutter/material.dart';

// Screen Imports
//--

// Widget Imports
import 'package:projekuaspbp/widgets/left_drawer.dart';
import 'package:projekuaspbp/widgets/main_app_bar.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Body, SnackBar).
    return Scaffold(
      appBar: MainAppBar(title: "Profil"),
      drawer: LeftDrawer(),
      body: Placeholder()
    );
  }

}