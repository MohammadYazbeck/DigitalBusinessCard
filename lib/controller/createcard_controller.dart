// ignore_for_file: deprecated_member_use, avoid_init_to_null, unused_local_variable, avoid_print
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/services/services.dart';

import '../core/middleware/models/card.dart';
import '../core/repositries/back_end_repo.dart';

abstract class CreateCardContoller extends GetxController {
  createCard();
  uploadImageGallery();
  uploadImageCamera();
  updatetemplate(int i);
  changeappcolor(int i);
}

class CreateCardContollerImp extends CreateCardContoller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final imagepicker = ImagePicker();
  late String imagePath;
  late File? image = null;
  int appcolor = 0;
  Card? card = Get.arguments?['card'];
  MyServices myServices = Get.find();

  late int profileid;
  // Profile info
  late TextEditingController displayname;
  late TextEditingController jobtitle;
  late TextEditingController about;
  late TextEditingController email;
  late TextEditingController address;

  // Phone Numbers
  late TextEditingController phonenumber1;
  late TextEditingController phonenumber2;

  // Social Media Links
  late TextEditingController facebook;
  late TextEditingController instagram;
  late TextEditingController linkedin;
  late TextEditingController github;

  late int templatenumber;

  @override
  createCard() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // if (myServices.sharedPreferences.getString("profileimage") == null) {
      //   myServices.sharedPreferences
      //       .setString("profileimage", AppImageAsset.profileimage);
      // } else {
      //   myServices.sharedPreferences.setString("profileimage", imagePath);
      // }

      myServices.sharedPreferences.setInt(
        "templatenumber",
        templatenumber,
      );
      myServices.sharedPreferences.setString(
        "displayname",
        displayname.text,
      );
      myServices.sharedPreferences.setString(
        "jobtitle",
        jobtitle.text,
      );
      myServices.sharedPreferences.setString(
        "about",
        about.text,
      );
      myServices.sharedPreferences.setString(
        "email",
        email.text,
      );
      myServices.sharedPreferences.setString(
        "address",
        address.text,
      );
      myServices.sharedPreferences.setString(
        "phonenumber1",
        phonenumber1.text,
      );
      myServices.sharedPreferences.setString(
        "phonenumber2",
        phonenumber2.text,
      );
      myServices.sharedPreferences.setString(
        "link1",
        facebook.text,
      );
      myServices.sharedPreferences.setString(
        "link2",
        instagram.text,
      );
      myServices.sharedPreferences.setString(
        "link3",
        linkedin.text,
      );
      myServices.sharedPreferences.setString(
        "link4",
        github.text,
      );
      myServices.sharedPreferences.setString("dimage",imagePath);


      myServices.sharedPreferences.setInt("profileid", profileid);
      try {
        BackEndRepo backEndRepo = Get.find<BackEndRepo>();
        log('k');
        Card sendCard = Card(
          name: displayname.text,
          job: jobtitle.text,
          profileImage: imagePath,
          about: about.text,
          address: address.text,
          email: email.text,
          phone1: phonenumber1.text,
          phone2: phonenumber2.text,
          facebook: facebook.text,
          instgram: instagram.text,
          linkedin: linkedin.text,
          github: github.text,
          template_id: templatenumber,
        );
        if (card != null) {
          await backEndRepo.updateCard(sendCard);
        } else {
          await backEndRepo.createCard(sendCard);
        }
        Get.offAllNamed(AppRoute.home);
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
  uploadImageGallery() async {
    final pickedimage = await imagepicker.getImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      imagePath = pickedimage.path;
      update();
    } else {
      printError(info: "No image selected");
    }
  }

  @override
  uploadImageCamera() async {
    final pickedimage = await imagepicker.getImage(source: ImageSource.camera);
    if (pickedimage != null) {
      image = File(pickedimage.path);
      imagePath = pickedimage.path;
      update();
    } else {
      printError(info: "No Photo Taken");
    }
  }

  @override
  void onInit() {
    imagePath  =  card?.profileImage ??"" ;
    profileid = myServices.sharedPreferences.getInt("profileid") ?? 0;
    templatenumber = myServices.sharedPreferences.getInt("templatenumber") ?? 0;
    displayname = TextEditingController(
        text: myServices.sharedPreferences.getString("displayname") ?? "");
    jobtitle = TextEditingController(
        text: myServices.sharedPreferences.getString("jobtitle") ?? "");
    about = TextEditingController(
        text: myServices.sharedPreferences.getString("about") ?? "");
    email = TextEditingController(
        text: myServices.sharedPreferences.getString("email") ?? "");
    address = TextEditingController(
        text: myServices.sharedPreferences.getString("address") ?? "");

    phonenumber1 = TextEditingController(
        text: myServices.sharedPreferences.getString("phonenumber1") ?? "");
    phonenumber2 = TextEditingController(
        text: myServices.sharedPreferences.getString("phonenumber2") ?? "");
    facebook = TextEditingController(
        text: myServices.sharedPreferences.getString("link1") ?? "");
    instagram = TextEditingController(
        text: myServices.sharedPreferences.getString("link2") ?? "");
    linkedin = TextEditingController(
        text: myServices.sharedPreferences.getString("link3") ?? "");
    github = TextEditingController(
        text: myServices.sharedPreferences.getString("link4") ?? "");

    super.onInit();
  }

  @override
  updatetemplate(int i) {
    templatenumber = i;
    myServices.sharedPreferences.setInt("templatenumber", templatenumber);
    printInfo(info: "Template $i Saved");
    Get.back(closeOverlays: true);
  }

  @override
  changeappcolor(int i) {
    appcolor = i;
    myServices.sharedPreferences.setInt("appcolor", appcolor);
    AppColor.changecolor(appcolor);
    update();
  }
}

// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');

//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer
//       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

//   return file;
// }
