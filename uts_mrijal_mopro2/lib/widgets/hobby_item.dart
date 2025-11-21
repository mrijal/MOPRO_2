// lib/widgets/hobby_item.dart
import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final String hobby;

  const HobbyItem({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 40),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.star_border, size: 18),
          SizedBox(width: 10),
          Expanded(child: Text(hobby)),
        ],
      ),
    );
  }
}
