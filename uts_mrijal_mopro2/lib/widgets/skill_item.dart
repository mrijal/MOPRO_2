// lib/widgets/skill_item.dart
import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final String skill;

  const SkillItem({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(skill),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    );
  }
}
