import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/middleware/models/user.dart';
import 'package:business_card/core/repositries/back_end_repo.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;

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
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  signup() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      try {
        BackEndRepo backEndRepo = Get.find<BackEndRepo>();
        User user = User(
          firstName: firstname.text,
          lastName: lastname.text,
          password: password.text,
          confirmPassword: confirmpassword.text,
          email: email.text,
        );
        await backEndRepo.signup(user);

        Get.toNamed(AppRoute.verifycodesignup,
            arguments: {"email": email.text});
      } on DioError catch (e) {
        if (e.response?.statusCode == 422) {
          //show dialog Get.dialog()
        }
      }
    } else {
      printError(info: "Not Valid Input");
    }
  }

  @override
  void onInit() {
    firstname = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }
}
