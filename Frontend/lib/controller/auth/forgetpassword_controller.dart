import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';

import '../../core/repositries/back_end_repo.dart';

abstract class ForgetPasswordController extends GetxController {
  goToResetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  goToResetPassword() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      BackEndRepo backEndRepo = Get.find<BackEndRepo>();

      var response = await backEndRepo.changepassword(email: email.text);
      log(response.toString());

      printInfo(info: "Valid");
    } else {
      printError(info: "Not Valid Input");
    }
    log(email.text);
    Get.offNamed(AppRoute.resetpassword, arguments: {"email": email.text});
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

}
