import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ProfileInfoDisplaySection extends StatelessWidget {
  final String info;
  final IconData icondata;

  const ProfileInfoDisplaySection(
      {super.key, required this.info, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 52,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: AppColor.primarytransColor,
                borderRadius: BorderRadius.circular(25)),
            child: Icon(
              icondata,
              size: 25,
              color: AppColor.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text(
              info,
              style: TextStyle(
                  fontSize: 15,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// TextFormField(
//         decoration: InputDecoration(
//       errorStyle: const TextStyle(fontSize: 11),
//       contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//       filled: true,
//       fillColor: AppColor.textfieldprimary,
//       suffixIcon: Icon(
//         icondata,
//         color: AppColor.primaryColor,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: AppColor.white),
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ));
