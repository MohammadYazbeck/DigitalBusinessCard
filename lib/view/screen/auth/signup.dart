import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/auth/signup_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/functions/alertexitapp.dart';
import 'package:business_card/core/functions/validinput.dart';
import 'package:business_card/view/widget/auth/authbutton.dart';
import 'package:business_card/view/widget/auth/authtextbutton.dart';
import 'package:business_card/view/widget/auth/authtextfield.dart';
import 'package:business_card/view/widget/auth/authtextheader.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.primaryColor,
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: WillPopScope(
              onWillPop: alertExitApp,
              child: Form(
                key: controller.formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const AuthTextHeader(
                      text: "Sign Up",
                    ),
                    SingleChildScrollView(
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 35),
                        width: MediaQuery.of(context).size.width - 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                AuthTextField(
                                    obscureText: false,
                                    valid: (val) {
                                      return validInput(val!, 3, 10, "name");
                                    },
                                    mycontroller: controller.firstname,
                                    labeltext: "Firstname",
                                    iconData: Icons.person),
                                AuthTextField(
                                    obscureText: false,
                                    valid: (val) {
                                      return validInput(val!, 2, 10, "name");
                                    },
                                    mycontroller: controller.lastname,
                                    labeltext: "Lastname",
                                    iconData: Icons.person),
                                AuthTextField(
                                    obscureText: false,
                                    valid: (val) {
                                      return validInput(val!, 8, 50, "email");
                                    },
                                    mycontroller: controller.email,
                                    labeltext: "Email",
                                    iconData: Icons.email),
                                GetBuilder<SignUpControllerImp>(
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
                                        return validInput(
                                            val!, 5, 30, "password");
                                      },
                                      mycontroller: controller.password,
                                      labeltext: "Password",
                                      iconData: Icons.lock),
                                ),
                                GetBuilder<SignUpControllerImp>(
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
                                          return validInput(
                                              val!, 5, 30, "password");
                                        },
                                        mycontroller:
                                            controller.confirmpassword,
                                        labeltext: "Confirm Password",
                                        iconData: Icons.lock)),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              child: AuthButton(
                                text: "Sign Up",
                                onPressed: () {
                                  controller.signup();
                                },
                              ),
                            ),
                            AuthTextButton(
                                textbutton: "Login",
                                text: "Already Have account ?",
                                onpressed: () {
                                  controller.goToLogin();
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

// we will be creating a widget for text field
