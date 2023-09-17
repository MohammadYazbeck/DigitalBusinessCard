import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Profile1DisplayName extends StatelessWidget {
  final String displayname;

  const Profile1DisplayName({super.key, required this.displayname});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayname,
      style: TextStyle(
          color: AppColor.white, fontSize: 29, fontWeight: FontWeight.w500),
    );
  }
}
