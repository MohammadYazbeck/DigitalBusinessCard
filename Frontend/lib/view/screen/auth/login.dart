// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/auth/login_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/functions/alertexitapp.dart';
import 'package:business_card/core/functions/validinput.dart';
import 'package:business_card/view/widget/auth/authbutton.dart';
import 'package:business_card/view/widget/auth/authtextbutton.dart';
import 'package:business_card/view/widget/auth/authtextfield.dart';
import 'package:business_card/view/widget/auth/authtextheader.dart';
import 'package:business_card/view/widget/auth/forgetpasswordbutton.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.primaryColor,
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => Form(
              key: controller.formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTextHeader(
                    text: "Login",
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height - 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            GetBuilder<LoginControllerImp>(
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
                                  return validInput(val!, 5, 30, "password");
                                },
                                mycontroller: controller.password,
                                labeltext: "Password",
                                iconData: Icons.lock,
                              ),
                            ),
                            // ForgetPasswordButton(
                            //   text: "Forget Password?",
                            //   ontap: () {
                            //     controller.goToForgetPassword();
                            //   },
                            // )
                          ],
                        ),
                        AuthButton(
                          text: "Login",
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        //
                        AuthTextButton(
                          textbutton: "Sign Up",
                          text: "Don't have an account ?",
                          onpressed: () {
                            controller.goToSignUp();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
