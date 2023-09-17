import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/data/datasource/static/static.dart';

class WelcomeIntro extends StatelessWidget {
  const WelcomeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          welcome.title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: AppColor.primaryColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          welcome.body!,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[700], fontSize: 18),
        ),
      ],
    );
  }
}
