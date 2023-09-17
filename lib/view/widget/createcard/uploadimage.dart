import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class UploadImage extends StatelessWidget {
  final void Function() ontap;
  final ImageProvider<Object> image;
  const UploadImage({super.key, required this.ontap, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(children: [
        Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: AppColor.primaryColor,
                blurRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CircleAvatar(
            backgroundImage: image,
            radius: MediaQuery.of(context).size.width - 310,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 135, left: 110),
          height: 38,
          width: 38,
          decoration: BoxDecoration(
              color: AppColor.primarytransColor,
              borderRadius: BorderRadius.circular(25)),
        ),
        Container(
            margin: const EdgeInsets.only(top: 140, left: 118),
            child: Icon(
              Icons.edit,
              size: 25,
              color: AppColor.white,
            )),
      ]),
    );
  }
}
