// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/auth/successresetpassword_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/view/widget/auth/authbutton.dart';
import 'package:business_card/view/widget/auth/authtextheader.dart';

class SuccsessResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor,
      body: Column(
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
                color: AppColor.white, borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.only(left: 40, right: 40, top: 10),
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height - 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Succsess!",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password has been reset.",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                AuthButton(
                  text: "Next",
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
