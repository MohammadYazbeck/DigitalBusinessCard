import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';

abstract class WelcomeController extends GetxController {
  login();
  signup();
}

class WelcomeControllerImp extends WelcomeController {
  late PageController pageController;
  @override
  login() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  signup() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
