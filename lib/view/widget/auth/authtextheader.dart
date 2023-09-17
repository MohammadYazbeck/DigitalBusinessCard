import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class AuthTextHeader extends StatelessWidget {
  final String text;
  // final String bodytext;
  const AuthTextHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      padding: const EdgeInsets.only(bottom: 30, top: 20),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
                color: AppColor.white,
                fontSize: 38,
                fontWeight: FontWeight.bold),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Text(
          // bodytext,
          // style: const TextStyle(fontSize: 15, color: AppColor.primaryColor),
          // )
        ],
      ),
    );
  }
}
