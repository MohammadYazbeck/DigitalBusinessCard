import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/middleware/models/auth.dart';
import 'package:business_card/core/repositries/back_end_repo.dart';
import 'package:business_card/core/services/app_service.dart';

import '../../core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myservices = Get.find();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidepassword = true;

  showPassword() {
    if (hidepassword == true) {
      hidepassword = false;
    } else {
      hidepassword = true;
    }
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      BackEndRepo backEndRepo = Get.find<BackEndRepo>();

      var response =
          await backEndRepo.login(email: email.text, password: password.text);

      AppService appService = Get.find<AppService>();
      log(response.toString(), name: "response");
      Auth auth = Auth.fromJson(response);
      appService.setToken(auth.token!); //tosave
      log(appService.token ?? "null");
      log(response.toString());
      if (auth.card != null) {

         myservices.sharedPreferences.setString("displayname",auth.card?.name ?? "");
         myservices.sharedPreferences.setString("jobtitle",auth.card?.job ?? "");
         myservices.sharedPreferences.setString("about",auth.card?.about ?? "");
         myservices.sharedPreferences.setString("email",auth.card?.email ?? "");
         myservices.sharedPreferences.setString("address",auth.card?.address ?? "");
         myservices.sharedPreferences.setString("phonenumber1",auth.card?.phone1 ?? "");
         myservices.sharedPreferences.setString("phonenumber2",auth.card?.phone2 ?? "");
         myservices.sharedPreferences.setString("link1",auth.card?.facebook ?? "");
         myservices.sharedPreferences.setString("link2",auth.card?.instgram ?? "");
         myservices.sharedPreferences.setString("link3",auth.card?.linkedin ?? "");
         myservices.sharedPreferences.setString("link4",auth.card?.github ?? "");
         myservices.sharedPreferences.setInt('templatenumber',auth.card?.template_id ?? 0);
         myservices.sharedPreferences.setString("firstname_image", auth.card?.profileImage ?? "https://cdn-icons-png.flaticon.com/512/149/149071.png");
print ("breakpoint");
        Get.offAllNamed(AppRoute.home);
      } else {
        Get.offAllNamed(AppRoute.createcard);
      }
    } else {
      printError(info: "Not Valid Input");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetpassword);
  }
}
