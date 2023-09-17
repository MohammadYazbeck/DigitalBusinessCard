import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/home_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/view/widget/homepage/homeappbarbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: BottomAppBar(
                  child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                padding: const EdgeInsets.only(bottom: 8, top: 10),
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeAppBarButton(
                        onPressed: () {
                          controller.changepage(0);
                        },
                        iconsize: 37,
                        iconData: Icons.person,
                        iconcolor: AppColor.black54,
                        active: controller.currentpage == 0 ? true : false),
                    HomeAppBarButton(
                        onPressed: () {
                          controller.changepage(1);
                        },
                        iconsize: 33,
                        iconData: Icons.contacts_outlined,
                        iconcolor: AppColor.black54,
                        active: controller.currentpage == 1 ? true : false)
                  ],
                ),
              )),
              body: controller.pages.elementAt(controller.currentpage),
            ));
  }
}
