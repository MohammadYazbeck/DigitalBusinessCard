import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

showError(String error) {
  return Get.defaultDialog(
    title: "ERROR",
    titlePadding: const EdgeInsets.only(top: 25, bottom: 15),
    titleStyle: const TextStyle(
        fontSize: 21,
        color: Color.fromARGB(255, 169, 70, 63),
        fontWeight: FontWeight.w600),
    // ignore: prefer_const_constructors
    content: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Text(
        error,
        style: TextStyle(color: AppColor.darkgrey, fontSize: 15),
      ),
    ),
    contentPadding: const EdgeInsets.all(20),
  );
}
