// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/auth/resetpassword_controller.dart';
// import 'package:get/get.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/functions/validinput.dart';
import 'package:business_card/view/widget/auth/authbutton.dart';
import 'package:business_card/view/widget/auth/authtextfield.dart';
import 'package:business_card/view/widget/auth/authtextheader.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor,
      body: Form(
        key: controller.formstate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              child: AuthTextHeader(
                text: "Reset Password",
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: 40, right: 40, top: 10),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height - 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      GetBuilder<ResetPasswordControllerImp>(
                          builder: (controller) => AuthTextField(
                                obscureText: controller.hidepassword,
                                onTapDown: (tap) {
                                  controller.showPassword();
                                },
                                onTapUp: (tap) {
                                  controller.showPassword();
                                },
                                onTapCancel: () {
                                  controller.showPassword();
                                },
                                valid: (val) {
                                  return validInput(val!, 10, 100, "password");
                                },
                                mycontroller: controller.password,
                                labeltext: "New Password",
                                iconData: Icons.lock,
                              )),
                      GetBuilder<ResetPasswordControllerImp>(
                          builder: (controller) => AuthTextField(
                                obscureText: controller.hidepassword,
                                onTapDown: (tap) {
                                  controller.showPassword();
                                },
                                onTapUp: (tap) {
                                  controller.showPassword();
                                },
                                onTapCancel: () {
                                  controller.showPassword();
                                },
                                valid: (val) {
                                  return validInput(val!, 10, 100, "password");
                                },
                                mycontroller: controller.confirmpassword,
                                labeltext: "Confirm New Passowrd",
                                iconData: Icons.lock,
                              )),
                    ],
                  ),
                  AuthButton(
                    text: "Reset",
                    onPressed: () async {
                      log(controller.email ?? "kk");
                      await controller.verifycode();
                      // controller.goToSuccses();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
