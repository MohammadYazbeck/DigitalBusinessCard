import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final ImageProvider<Object> profileimage;

  const ProfileImage({super.key, required this.profileimage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundImage: profileimage,
        radius: 100,
      ),
    );
  }
}
