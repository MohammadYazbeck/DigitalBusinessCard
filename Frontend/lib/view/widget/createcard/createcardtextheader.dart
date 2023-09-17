import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class CreateCardTextHeader extends StatelessWidget {
  final String text;
  const CreateCardTextHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColor.white, fontSize: 30, fontWeight: FontWeight.w500),
      ),
    );
  }
}
