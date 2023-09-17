import 'dart:developer';

import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/middleware/models/auth.dart';
import 'package:business_card/core/services/app_service.dart';

import '../../core/repositries/back_end_repo.dart';

class VerifyCodeSignUpControllerImp extends GetxController {
  String? email;
  String? code;

  goToSuccessSignUp() async {
    BackEndRepo backEndRepo = Get.find<BackEndRepo>();
    try {
      var response = await backEndRepo.verify(code: code, email: email);

      log(response.toString());
      AppService appService = Get.find<AppService>();
      Auth auth = Auth.fromJson(response);
      // appService.setToken(auth.token!); //to
      log(appService.token ?? "null");

      await Get.offNamed(AppRoute.succsesssignup);
    } catch (e) {}
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
