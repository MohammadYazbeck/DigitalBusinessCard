import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/onboarding_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/view/widget/onboarding/custombutton.dart';
import 'package:business_card/view/widget/onboarding/customslider.dart';
import 'package:business_card/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height - 140,
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            // width: MediaQuery.of(context).size.width - 50,
            child: Column(children: [
              const Expanded(
                flex: 3,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      CustomDotControllerOnBoarding(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButtonOnBoarding(),
                    ],
                  ))
            ]),
          ),
        ));
  }
}
