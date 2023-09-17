import 'dart:developer';

import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';

import '../../core/repositries/back_end_repo.dart';

class VerifyCodeControllerImp extends GetxController {
  String? password;
  String? confirmpassword;
  String? email;
  String? code;

  checkcode() async {
    // BackEndRepo backEndRepo = Get.find<BackEndRepo>();
    //
    // var response = await backEndRepo.verify(code: code, email: email);
    // log(response.toString());
    Get.offNamed(AppRoute.succsessresetpassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'] as String?;
    password= Get.arguments['password'] as String?;
    confirmpassword= Get.arguments['confirmpassword'] as String?;

    super.onInit();
  }
}
