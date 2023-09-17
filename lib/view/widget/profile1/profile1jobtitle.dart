import 'package:flutter/material.dart';

class Profile1JobTitle extends StatelessWidget {
  final String text;
  const Profile1JobTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[350]),
    );
  }
}
