import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';

class AuthTextField extends StatelessWidget {
  final String labeltext;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool obscureText;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTapCancel;

  const AuthTextField(
      {super.key,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      this.onTapDown,
      this.onTapUp,
      required this.obscureText,
      this.onTapCancel});

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
          height: 4,
        ),
        // Container(
        //   height: 40,
        //   decoration: BoxDecoration(boxShadow: const [
        //     BoxShadow(
        //       offset: Offset(0, 2.5),
        //       color: Color.fromARGB(255, 217, 213, 213),
        //       blurRadius: 3,
        //     ),
        //     BoxShadow(
        //       offset: Offset(0, 0),
        //       color: Colors.white,
        //       blurRadius: 2,
        //     )
        //   ], borderRadius: BorderRadius.circular(12)),
        //   child:
        TextFormField(
            validator: valid,
            obscureText: obscureText,
            controller:
                mycontroller, //This is for getting the text from the feild
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 11),
              contentPadding:
                  const EdgeInsets.only(top: 5, left: 15, right: 15),
              filled: true,
              fillColor: AppColor.textfieldprimary,
              suffixIcon: InkWell(
                onTapDown: onTapDown,
                onTapUp: onTapUp,
                onTapCancel: onTapCancel,
                child: Icon(
                  iconData,
                  color: AppColor.primaryColor,
                ),
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
