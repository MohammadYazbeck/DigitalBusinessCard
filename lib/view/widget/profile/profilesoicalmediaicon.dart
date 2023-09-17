import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSocialMediaIcon extends StatelessWidget {
  final void Function()? onPressed;
  final IconData socialmediaicon;
  final Color? color;
  const ProfileSocialMediaIcon(
      {super.key, this.onPressed, required this.socialmediaicon, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(socialmediaicon),
      iconSize: 44,
      color: color,
    );
  }
}
