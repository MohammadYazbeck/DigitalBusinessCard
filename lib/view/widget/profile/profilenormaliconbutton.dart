import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ProfileNormalIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final double iconsize;
  const ProfileNormalIconButton(
      {super.key, this.onPressed, required this.icon, required this.iconsize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: iconsize,
      color: AppColor.primaryColor,
    );
  }
}
