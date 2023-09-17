import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widget/profile/profiledialogbutton.dart';
import '../constant/color.dart';

dialogFunction(void Function()? buttonOnPressed, String? buttontitle,
    String dialogtitle, String message) {
  Get.defaultDialog(
    title: dialogtitle,
    titlePadding: const EdgeInsets.only(top: 25, bottom: 15),
    titleStyle: const TextStyle(
        fontSize: 21,
        color: Color.fromARGB(255, 63, 169, 100),
        fontWeight: FontWeight.w600),
    // ignore: prefer_const_constructors
    content: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.darkgrey, fontSize: 15),
          ),
          const SizedBox(
            height: 25,
          ),
          ProfileDialogbutton(
            text: buttontitle!,
            onPressed: buttonOnPressed,
          )
        ],
      ),
    ),
    contentPadding: const EdgeInsets.all(20),
  );
}
