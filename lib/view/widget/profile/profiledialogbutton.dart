import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ProfileDialogbutton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ProfileDialogbutton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 55,
        minWidth: double.infinity,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(15)),
        color: AppColor.primaryColor,
        disabledColor: AppColor.primaryColor,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}
