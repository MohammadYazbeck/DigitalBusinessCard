import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/welcome_controller.dart';
import 'package:business_card/core/constant/color.dart';

class WelcomeSignupButton extends GetView<WelcomeControllerImp> {
  const WelcomeSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 55,
      onPressed: () {
        controller.signup();
      },
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(50)),
      child: const Text(
        "Sign Up",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }
}
