// Flutter Imports
import 'package:flutter/material.dart';

// Screen Imports
//--

// Widget Imports
import 'package:projekuaspbp/widgets/left_drawer.dart';
import 'package:projekuaspbp/widgets/main_app_bar.dart';

class PapanBerbagi extends StatelessWidget {
  const PapanBerbagi({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Body, SnackBar).
    return Scaffold(
      appBar: MainAppBar(title: "Papan Berbagi"),
      drawer: LeftDrawer(),
      body: Placeholder()
    );
  }

}