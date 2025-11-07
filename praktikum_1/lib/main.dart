import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas E Learning',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF6D28D9, {
          50: Color(0xFFE8D9F2),
          100: Color(0xFFD1B2E8),
          200: Color(0xFFB58CD6),
          300: Color(0xFF9B66C4),
          400: Color(0xFF8A4FB5),
          500: Color(0xFF6D28D9),
          600: Color(0xFF6D28D9),
          700: Color(0xFF6D28D9),
        }),
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
          bodySmall: TextStyle(fontSize: 14, color: Colors.black),
          titleLarge: TextStyle(
            fontSize: 24,
            fontFamily: 'Quantify',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'Quantify',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6D28D9),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF6D28D9),
          secondary: const Color(0xFF8A4FB5),
          surface: const Color(0xFF1E1E2A),
          background: const Color(0xFF121212),
          onPrimary: Colors.white,
          onSurface: Colors.white70,
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          titleLarge: TextStyle(
            fontSize: 24,
            fontFamily: 'Bunya',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8A4FB5),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // ambil theme sekarang

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hallo,', style: theme.textTheme.titleMedium),
              const SizedBox(width: 8),
              Text('I am Muhammad Rijal', style: theme.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BiodataPage()),
              );
            },
            icon: const Icon(Icons.info_outline),
            label: const Text('Check My Info'),
          ),
        ],
      ),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Biodata'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('images/profile.jpg'),
                backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 20),

            // Nama
            Text(
              'Muhammad Rijal',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Kontak
            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone, color: theme.colorScheme.primary),
                subtitle: const Text('Phone'),
                title: const Text('+62 85156649806'),
              ),
            ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Icon(Icons.email, color: theme.colorScheme.primary),
                subtitle: const Text('Email'),
                title: const Text('mrijal110@gmail.com'),
              ),
            ),

            // Deskripsi diri
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'I am a Fullstack Web Developer and Informatic Engineering Student. '
                'Able to create responsive and user-friendly web applications using Laravel, React, and Flutter.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),

            // Skill Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Skills',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        Chip(label: Text('Laravel')),
                        Chip(label: Text('PHP')),
                        Chip(label: Text('JavaScript')),
                        Chip(label: Text('MySQL')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol kembali
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
