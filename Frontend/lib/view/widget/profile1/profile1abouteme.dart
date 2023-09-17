import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Profile1AboutMeSection extends StatelessWidget {
  final String text;
  const Profile1AboutMeSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 30,
        padding:
            const EdgeInsets.only(left: 30, right: 50, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "About Me:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkgrey),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(195, 25, 24, 24)),
            ),
          ],
        ));
  }
}
