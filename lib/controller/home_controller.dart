import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:business_card/view/screen/contactlist.dart';
import 'package:business_card/view/screen/profile.dart';

import '../core/functions/choosetemplate.dart';
import '../core/services/services.dart';

abstract class HomeController extends GetxController {
  changepage(int index);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  int currentpage = 0;
  late int templatenumber;
  late List<Widget> pages;


  @override
  changepage(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    templatenumber = myServices.sharedPreferences.getInt("templatenumber") ?? 0;
    pages = [
      chooseTemplate(templatenumber ?? 0),
      const ContactList()
    ];
    super.onInit(

    );
  }
}
