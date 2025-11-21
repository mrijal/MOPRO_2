// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mrijal_mopro2/pages/profile_cubit.dart';
import 'models/profile.dart';
import 'pages/profile_page.dart';
import 'models/project.dart';

final sampleProfile = Profile(
  nama: 'Muhammad Rijal',
  nim: '23552011138',
  jurusan: 'Teknik Informatika',
  email: 'mrijal110@gmail.com',
  telepon: '+62 851-5664-9806',
  fotoUrl: 'images/profile.jpg',
  hobi: ['Gaming', 'Reading', 'Coding', 'Hiking'],
  skill: ['Laravel', 'Flutter', 'Git', 'REST API', 'SQL', 'Photography'],
  portfolio: [
    Project(
      title: "Website MPL",
      description: "Website yang memuat semua informasi terkait MPL.",
      imageUrl: "images/mpl.png",
    ),
    Project(
      title: "Website Topup Robux Online",
      description:
          "Platform topup Robux dengan sistem pembayaran online, terdapat fitur keranjang dan pembayaran dengan payment gateway.",
      imageUrl: "images/roblox.png",
    ),
    Project(
      title: "Company Profile",
      description:
          "Website company profile untuk sebuah perusahaan startup teknologi.",
      imageUrl: "images/compro.png",
    ),
  ],

  status: Status.aktif,
);
void main() {
  runApp(
    BlocProvider(
      create: (_) => ProfileCubit(sampleProfile), // <-- kirim profile bro
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  // helper untuk route names (opsional)
  static const profilRoute = '/';
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = Color(0xFF3B82F6); // biru
    final secondary = Color(0xFF06B6D4); // teal

    final theme = ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
      ),
      scaffoldBackgroundColor: isDark
          ? Colors.grey[900]
          : Colors.grey[50], // background
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        color: isDark ? Colors.grey[800] : Colors.white,
        shadowColor: isDark ? Colors.black54 : Colors.grey[300],
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
      ),
    );

    return MaterialApp(
      title: 'Profil Mahasiswa',
      theme: theme,
      home: Builder(
        builder: (context) {
          // Kita pass toggle callback via route arguments for profil_page to access
          return Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                settings: RouteSettings(arguments: toggleTheme),
                builder: (_) => ProfilPage(profile: sampleProfile),
              );
            },
          );
        },
      ),
    );
  }
}
