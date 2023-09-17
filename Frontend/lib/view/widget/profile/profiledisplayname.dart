import 'package:flutter/material.dart';

class ProfileDisplayName extends StatelessWidget {
  final String displayname;

  const ProfileDisplayName({super.key, required this.displayname});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayname,
      style: const TextStyle(
          color: Colors.black87, fontSize: 26, fontWeight: FontWeight.w600),
    );
  }
}
