import 'dart:developer';

import 'package:business_card/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/enums/role.dart';
import 'package:business_card/core/services/services.dart';

class AppService extends GetxService {
  MyServices service = Get.find<MyServices>();
  Role role = Role.unRegisteredUser;
  @override
  void onInit() {
    super.onInit();
    if (token != null && token != '') {
      log(token ?? "");
      role = Role.user;
    }
  }


  setToken(String token) {
    myServices.sharedPreferences.setString('token', token);
    role = Role.user;
  }

  String? get token => myServices.sharedPreferences.getString('token');

  deleteToken() {
    myServices.sharedPreferences.remove('token');
    role = Role.unRegisteredUser;
    Get.offAllNamed(AppRoute.welcome);
  }
  String initialRoute(){
    log(token??"",name:"Token");
    switch(role){
      case Role.unRegisteredUser:
        return AppRoute.welcome;
      case Role.user:
        return AppRoute.home;
        default:
      return AppRoute.welcome;
    }

  }
}
