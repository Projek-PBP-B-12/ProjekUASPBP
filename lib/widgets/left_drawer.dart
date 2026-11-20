// Flutter Imports
import 'package:flutter/material.dart';

// Screen Imports
import 'package:projekuaspbp/screens/landing_page.dart';
import 'package:projekuaspbp/screens/beranda.dart';
import 'package:projekuaspbp/screens/makananku.dart';
import 'package:projekuaspbp/screens/tambah_makanan.dart';
import 'package:projekuaspbp/screens/papan_berbagi.dart';
import 'package:projekuaspbp/screens/peta_berbagi.dart';
import 'package:projekuaspbp/screens/lokasi_tersimpan.dart';
import 'package:projekuaspbp/screens/notifikasi.dart';
import 'package:projekuaspbp/screens/profil.dart';

// Widget Imports
//--

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget page;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.page,
  });
}

class LeftDrawer extends StatelessWidget {
  LeftDrawer({super.key});

  final drawerItems = [
    DrawerItem(
      title: 'Beranda',
      icon: Icons.home_outlined,
      page: Beranda(),
    ),
    DrawerItem(
      title: 'Makananku',
      icon: Icons.kitchen_outlined,
      page: Makananku(),
    ),
    DrawerItem(
      title: 'Tambah Makanan',
      icon: Icons.add_circle_outline,
      page: TambahMakanan(),
    ),
    DrawerItem(
      title: 'Papan Berbagi',
      icon: Icons.volunteer_activism_outlined,
      page: PapanBerbagi(),
    ),
    DrawerItem(
      title: 'Peta Berbagi',
      icon: Icons.map_outlined,
      page: PetaBerbagi(),
    ),
    DrawerItem(
      title: 'Lokasi Tersimpan',
      icon: Icons.bookmark_outline,
      page: LokasiTersimpan(),
    ),
    DrawerItem(
      title: 'Notifikasi',
      icon: Icons.notifications_outlined,
      page: Notifikasi(),
    ),
    DrawerItem(
      title: 'Profil',
      icon: Icons.person_outline,
      page: Profil(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TitikLapar',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Selamatkan makanan sebelum terlupakan.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        // Generate drawer items
        ...drawerItems.map((item) {
          return ListTile(
            leading: Icon(item.icon),
            title: Text(item.title),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => item.page),
              );
            },
          );
        }),

        ],
      ),
    );
  }
}