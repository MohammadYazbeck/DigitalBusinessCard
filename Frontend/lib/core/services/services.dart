import 'package:get/get.dart';
import 'package:business_card/core/repositries/back_end_repo.dart';
import 'package:business_card/core/services/app_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Get.put(BackEndRepo());
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  Get.put(AppService());
}
