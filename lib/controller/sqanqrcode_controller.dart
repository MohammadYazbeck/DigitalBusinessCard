// ignore_for_file: unused_element

import 'dart:developer';

import 'package:business_card/core/middleware/models/card.dart';
import 'package:business_card/core/repositries/back_end_repo.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/services/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

abstract class ScanQrCodController extends GetxController {
  void screenwasclosed();
  viewscannedcard();
  goback();
}

class ScanQrCodControllerImp extends ScanQrCodController {
  MobileScannerController cameraController = MobileScannerController();
  BackEndRepo _backEndRepo = Get.find();
  bool screenopend = false;
  String? scannedIdByQR;
  MyServices myServices = Get.find();

  @override
  screenwasclosed() {
    screenopend = false;
  }

  @override
  viewscannedcard() {
    // myServices.sharedPreferences.setString("scannedIdByQR", scannedIdByQR!);
    // GET DATA OF THIS ID AND ASSING IT

    //    // Send scannedIdByQR code to Api and recive card infromation
    // // save information locally on :
    // myServices.sharedPreferences.setInt("templatenumberscanned", -100);
    // myServices.sharedPreferences
    //     .setString("profileimagescanned", AppImageAsset.profileimage);
    // myServices.sharedPreferences.setString("displaynamescanned", "");
    // myServices.sharedPreferences.setString("jobtitlescanned", "");
    // myServices.sharedPreferences.setString("aboutscanned", "");
    // myServices.sharedPreferences.setString("emailscanned", "");
    // myServices.sharedPreferences.setString("addressscanned", "");
    // myServices.sharedPreferences.setString("phonenumber1scanned", "");
    // myServices.sharedPreferences.setString("phonenumber2scanned", "");
    // myServices.sharedPreferences.setString("link1scanned", "");
    // myServices.sharedPreferences.setString("link2scanned", "");
    // myServices.sharedPreferences.setString("link3scanned", "");
    // myServices.sharedPreferences.setString("link4scanned", "");
    // screenopend = false;
    // Get.offAndToNamed(AppRoute.viewscannedcard);
  }
  getContact(String? data) async {
    if (data != null) {
      var response = await _backEndRepo.getCard(int.parse(data));
      log(response.toString());
      Card card = Card.fromJson(response['card']);
      log(card.job.toString(), name: "card");

      Get.toNamed(AppRoute.viewscannedcard, arguments: card);
    }
    else{
      log('else');
    }
  }

  @override
  goback() {
    Get.offAllNamed(AppRoute.home);
  }
}
