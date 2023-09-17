import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';

class CreateCardColor extends StatelessWidget {
  final Color color;
  final int colorid;
  final void Function() onTap;
  const CreateCardColor(
      {super.key,
      required this.color,
      required this.onTap,
      required this.colorid});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border: myServices.sharedPreferences.getInt("appcolor") == colorid
                ? Border.all(color: Colors.blue, width: 3)
                : Border.all(color: AppColor.black54, width: 2)),
      ),
    );
  }
}
