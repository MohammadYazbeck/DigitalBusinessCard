import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ProfileJobTitle extends StatelessWidget {
  final String text;
  const ProfileJobTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.grey),
    );
  }
}
