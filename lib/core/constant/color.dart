import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

MyServices myServices = Get.find();

class AppColor {
  static Color grey = const Color.fromARGB(255, 142, 137, 137);
  static Color primaryColor = const Color.fromARGB(255, 150, 202, 255);
  static Color white = Colors.white;
  static Color darkgrey = const Color.fromARGB(221, 55, 55, 55);
  static Color textfieldprimary = const Color.fromARGB(49, 104, 185, 255);
  static Color primarytransColor = const Color.fromARGB(30, 104, 184, 255);
  static Color minicardbg = const Color.fromARGB(32, 88, 177, 255);
  static Color black54 = Colors.black54;

  static changecolor(int i) {
    int color = myServices.sharedPreferences.getInt("appcolor") ?? 0;
    if (color == 0) {
      primaryColor = const Color.fromARGB(255, 150, 202, 255);
      textfieldprimary = const Color.fromARGB(30, 104, 185, 255);
      primarytransColor = const Color.fromARGB(131, 104, 185, 255);
      minicardbg = const Color.fromARGB(32, 88, 177, 255);
    }
    if (color == 1) {
      primaryColor = const Color.fromARGB(255, 255, 150, 150);
      textfieldprimary = const Color.fromARGB(31, 255, 150, 150);
      primarytransColor = const Color.fromARGB(134, 255, 150, 150);
      minicardbg = const Color.fromARGB(52, 255, 150, 150);
    }
    if (color == 2) {
      primaryColor = const Color.fromARGB(255, 202, 150, 255);
      textfieldprimary = const Color.fromARGB(32, 202, 150, 255);
      primarytransColor = const Color.fromARGB(135, 202, 150, 255);
      minicardbg = const Color.fromARGB(59, 202, 150, 255);
    }
    if (color == 3) {
      primaryColor = const Color.fromARGB(255, 104, 175, 143);
      textfieldprimary = const Color.fromARGB(30, 110, 183, 150);
      primarytransColor = const Color.fromARGB(135, 96, 164, 133);
      minicardbg = const Color.fromARGB(47, 95, 163, 132);
    }
  }
}
