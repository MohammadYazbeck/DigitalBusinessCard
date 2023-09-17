import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/welcome_controller.dart';
import 'package:business_card/core/constant/color.dart';

class WelcomeLoginButton extends GetView<WelcomeControllerImp> {
  const WelcomeLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 55,
      onPressed: () {
        controller.login();
      },
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        "Login",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.primaryColor,
            fontSize: 20),
      ),
    );
  }
}
