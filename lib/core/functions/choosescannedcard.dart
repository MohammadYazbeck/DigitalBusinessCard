import 'package:business_card/core/constant/routes.dart';
import 'package:get/get.dart';

choosescannedcard(int templatenumber) {
  if (templatenumber == 0) {
    return AppRoute.viewscannedcard;
  }
  if (templatenumber == 1) {
    return AppRoute.viewscannedcard1;
  }
  if (templatenumber == 2) {
    return AppRoute.viewscannedcard2;
  }
  if (templatenumber == 3) {
    return AppRoute.viewscannedcard3;
  }
}
