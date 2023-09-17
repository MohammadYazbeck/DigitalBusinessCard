import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Profile1NormalIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final double iconsize;
  const Profile1NormalIconButton(
      {super.key, this.onPressed, required this.icon, required this.iconsize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: iconsize,
      color: AppColor.white,
    );
  }
}
