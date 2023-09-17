import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/view/widget/auth/authtextheader.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, bottom: 80),
            child: const AuthTextHeader(
              text: "Confirm Code",
            ),
          ),
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: AppColor.white),
            child: ListView(children: [
              Text(
                "Enter the verifcation code we sent to your email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: OtpTextField(
                  fieldWidth: 50,
                  filled: true,
                  fillColor: AppColor.textfieldprimary,
                  numberOfFields: 5,
                  borderColor: AppColor.primaryColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {}, // end onSubmit
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
