// lib/models/profile.dart
import 'package:uts_mrijal_mopro2/models/project.dart';

enum Status { aktif, cuti, lulus }

class Profile {
  final String nama;
  final String nim;
  final String jurusan;
  final String email;
  final String telepon;
  final String fotoUrl;
  List<String> hobi;
  List<String> skill;
  Status status;
  List<Project> portfolio;

  Profile({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.email,
    required this.telepon,
    required this.fotoUrl,
    required this.hobi,
    required this.skill,
    required this.status,
    required this.portfolio,
  });

  void addHobby(String hobby) {
    hobi.add(hobby);
  }

  bool removeSkill(String s) {
    return skill.remove(s);
  }

  String statusText() {
    switch (status) {
      case Status.aktif:
        return 'Aktif';
      case Status.cuti:
        return 'Cuti';
      case Status.lulus:
        return 'Lulus';
    }
  }

  Profile copyWith({
    String? nama,
    String? nim,
    String? jurusan,
    String? email,
    String? telepon,
    String? fotoUrl,
    Status? status,
    List<String>? hobi,
    List<String>? skill,
    List<Project>? portfolio,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      jurusan: jurusan ?? this.jurusan,
      email: email ?? this.email,
      telepon: telepon ?? this.telepon,
      fotoUrl: fotoUrl ?? this.fotoUrl,
      status: status ?? this.status,
      hobi: hobi ?? this.hobi,
      skill: skill ?? this.skill,
      portfolio: portfolio ?? this.portfolio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nim': nim,
      'jurusan': jurusan,
      'email': email,
      'telepon': telepon,
      'fotoUrl': fotoUrl,
      'hobi': hobi,
      'skill': skill,
      'status': status.index,
    };
  }
}
