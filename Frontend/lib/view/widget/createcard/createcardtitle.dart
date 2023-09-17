import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class CreateCardTitle extends StatelessWidget {
  final String text;
  const CreateCardTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, top: 15),
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
