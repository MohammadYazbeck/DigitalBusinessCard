// ignore_for_file: prefer_const_constructors
import 'package:business_card/core/services/app_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:business_card/core/services/services.dart';
import 'package:business_card/routes.dart';
// import 'package:business_card/view/screen/createcard.dart';
// import 'package:business_card/view/screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppService appService = Get.find<AppService>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Digital Buisness Card",
      // routes: routes,
      initialRoute: appService.initialRoute(),
      getPages: routes,
    );
  }
}
