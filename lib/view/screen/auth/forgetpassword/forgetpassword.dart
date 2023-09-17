// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/auth/forgetpassword_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/functions/validinput.dart';
import 'package:business_card/view/widget/auth/authbutton.dart';
import 'package:business_card/view/widget/auth/authtextfield.dart';
import 'package:business_card/view/widget/auth/authtextheader.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
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
                text: "Forget Password",
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.only(left: 40, right: 40, top: 10),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height - 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      AuthTextField(
                        obscureText: false,
                        valid: (val) {
                          return validInput(val!, 5, 50, "email");
                        },
                        mycontroller: controller.email,
                        labeltext: "Email",
                        iconData: Icons.email,
                      ),
                    ],
                  ),
                  AuthButton(
                    text: "Reset Password",
                    onPressed: () {
                      controller.goToResetPassword();
                    },
                  ),
                  SizedBox(
                    height: 15,
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
