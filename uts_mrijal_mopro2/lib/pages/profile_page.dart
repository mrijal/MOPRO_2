// lib/pages/profil_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mrijal_mopro2/pages/profile_cubit.dart';
import 'package:uts_mrijal_mopro2/widgets/project_item.dart';
import '../models/profile.dart';
import '../widgets/info_card.dart';
import '../widgets/skill_item.dart';
import '../widgets/hobby_item.dart';
import '../models/project.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilPage extends StatefulWidget {
  final Profile profile;
  const ProfilPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late Profile profile;
  bool showGridSkills = false;

  @override
  void initState() {
    super.initState();
  }

  void toggleThemeRequest(VoidCallback onToggle) {
    // wrapper to call parent theme toggle via callback (main.dart passes it)
    onToggle();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    final isWide = media.size.width > 600;
    final profile = context.watch<ProfileCubit>().state;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background accent
            Positioned(
              right: -80,
              top: -120,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Header: Foto + nama + status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Foto
                      CircleAvatar(
                        radius: isWide ? 60 : 48,
                        backgroundImage: Image.asset(profile.fotoUrl).image,
                        backgroundColor: Colors.grey[200],
                      ),
                      SizedBox(width: 12),
                      // Nama, NIM, Jurusan
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.nama,
                              style: GoogleFonts.poppins(
                                fontSize: isWide ? 24 : 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${profile.jurusan} • ${profile.nim}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: theme.textTheme.bodyMedium?.color,
                              ),
                            ),
                            SizedBox(height: 8),
                            // Status chip & contact icons
                            Row(
                              children: [
                                Chip(
                                  label: Text(profile.statusText()),
                                  avatar: Icon(Icons.person),
                                ),
                                SizedBox(width: 12),
                                IconButton(
                                  onPressed: () {
                                    // contoh manipulasi: tambahkan hobby
                                    setState(() {
                                      profile.addHobby('Mancing');
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  tooltip: 'Tambahkan contoh hobi (demo)',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  // Info cards (email, phone)
                  InfoCard(
                    icon: Icons.email,
                    title: 'Email',
                    subtitle: profile.email,
                  ),
                  InfoCard(
                    icon: Icons.phone,
                    title: 'Telepon',
                    subtitle: profile.telepon,
                  ),

                  SizedBox(height: 12),

                  // Hobi (ListView.builder)
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hobi',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          // ListView.builder inside Column -> use SizedBox
                          SizedBox(
                            height: 160,
                            child: ListView.builder(
                              itemCount: profile.hobi.length,
                              itemBuilder: (context, index) {
                                return HobbyItem(hobby: profile.hobi[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Skills (GridView.builder + toggle)
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Skill',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    showGridSkills = !showGridSkills;
                                  });
                                },
                                icon: Icon(
                                  showGridSkills
                                      ? Icons.view_list
                                      : Icons.grid_view,
                                ),
                                tooltip: 'Toggle grid/list',
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          // GridView.builder or ListView
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: showGridSkills
                                ? SizedBox(
                                    key: ValueKey('grid'),
                                    height: 160,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: isWide ? 4 : 3,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                            childAspectRatio: 3,
                                          ),
                                      itemCount: profile.skill.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                          child: Text(profile.skill[index]),
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    key: ValueKey('list'),
                                    height: 160,
                                    child: ListView.builder(
                                      itemCount: profile.skill.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        child: SkillItem(
                                          skill: profile.skill[index],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 18),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Portfolio',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12),

                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: profile.portfolio.length,
                            itemBuilder: (context, index) {
                              final project = profile.portfolio[index];
                              return ProjectItem(
                                project: project,
                                onTap: () =>
                                    showProjectDetail(context, project),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  // Footer Card with simple responsive layout
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: isWide
                          ? Row(
                              children: [
                                Expanded(child: Text('Update status profil:')),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<ProfileCubit>().setStatus(
                                      Status.lulus,
                                    );
                                  },
                                  icon: Icon(Icons.school),
                                  label: Text('Lulus'),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<ProfileCubit>().setStatus(
                                      Status.cuti,
                                    );
                                  },
                                  icon: Icon(Icons.free_breakfast),
                                  label: Text('Cuti'),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text('Update status profil:'),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<ProfileCubit>().setStatus(
                                      Status.lulus,
                                    );
                                  },
                                  icon: Icon(Icons.school),
                                  label: Text('Lulus'),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<ProfileCubit>().setStatus(
                                      Status.cuti,
                                    );
                                  },
                                  icon: Icon(Icons.free_breakfast),
                                  label: Text('Cuti'),
                                ),
                              ],
                            ),
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),

            // Floating Toggle (top-right) untuk toggle theme — parent main.dart menerima toggle dari sini
            Positioned(
              top: 12,
              right: 18,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    onPressed: () {
                      // Memanggil parent via Navigator context: kita gunakan Inherited widget? Simpler:
                      // Kita trigger melalui Notification (simpler approach: use an inherited callback).
                      // But since main.dart wraps MaterialApp and controls theme, main.dart will expose a global key method.
                      // For simplicity, we use a Navigator.popUntil hack — instead, assume main.dart provides a ThemeMode toggle via a static function.
                      // To keep file self-contained, we'll use a simple approach: call a method on ancestor that we pass via ModalRoute settings
                      final toggler = ModalRoute.of(
                        context,
                      )?.settings.arguments;
                      if (toggler is VoidCallback) {
                        toggler();
                      } else {
                        // fallback: show snackbar (non-fatal)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Theme toggle not attached')),
                        );
                      }
                    },
                    child: Icon(Icons.brightness_6),
                    tooltip: 'Toggle Light/Dark',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showProjectDetail(BuildContext context, Project project) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 6,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  project.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              Text(
                project.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              Text(
                project.description,
                style: GoogleFonts.poppins(fontSize: 14),
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      );
    },
  );
}
