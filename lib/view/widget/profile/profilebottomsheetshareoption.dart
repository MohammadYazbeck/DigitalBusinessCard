import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ProfileBottomSheetShareOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  const ProfileBottomSheetShareOption(
      {super.key, required this.text, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.white,
        ),
        width: 380,
        height: 49,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 10, top: 1, bottom: 1, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 33,
              color: AppColor.darkgrey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 1, left: 17),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.darkgrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
