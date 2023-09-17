import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ForgetPasswordButton extends StatelessWidget {
  final String text;
  final void Function() ontap;

  const ForgetPasswordButton(
      {super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: ontap,
        child: Text(
          text,
          style: TextStyle(
              color: AppColor.grey, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
