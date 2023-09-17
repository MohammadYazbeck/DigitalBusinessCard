// ignore_for_file: deprecated_member_use

import 'package:business_card/core/middleware/models/card.dart';
import 'package:business_card/core/repositries/back_end_repo.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/services/services.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ViewScannedCardController extends GetxController {
  Future launchemail();
  Future launchphonenumber(int i);
}

class ViewScannedCardControllerImp extends ViewScannedCardController {
  MyServices myServices = Get.find();
  Card card = Get.arguments;
  late String imagePath;

  late String displayname;
  late String jobtitle;
  late String about;
  late String email;
  late String address;

// Phone Numbers
  late String phonenumber1;
  late String phonenumber2;

// Social Media Links
  late String link1;
  late String link2;
  late String link3;
  late String link4;
  BackEndRepo _backEndRepo = Get.find();

  @override
  Future launchemail() async {
    await launch('mailto:$email?subject=Subject');
  }

  @override
  Future launchphonenumber(int i) async {
    if (i == 1) {
      await launch('tel:$phonenumber1');
    } else {
      await launch('tel:$phonenumber2');
    }
  }

  addToContactList() async {
    var response = await _backEndRepo.addContact(card.id);
    // log(response.data);
    Get.offAllNamed(AppRoute.home);
  }
}
