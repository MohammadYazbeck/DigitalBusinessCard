import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
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
