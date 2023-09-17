import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class ProfileDialogTextField extends StatelessWidget {
  final String labeltext;
  final IconData icondata;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;

  const ProfileDialogTextField({
    super.key,
    required this.labeltext,
    required this.mycontroller,
    required this.icondata,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labeltext,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(221, 55, 55, 55)),
        ),
        const SizedBox(
          height: 5,
        ),

        TextFormField(
            validator: valid,
            controller: mycontroller,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 11),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              filled: true,
              fillColor: AppColor.textfieldprimary,
              suffixIcon: Icon(
                icondata,
                color: AppColor.primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.white),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
            )),
        // ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
