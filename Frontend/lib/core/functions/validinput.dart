import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Field can't be empty";
  }
  if (val.length < min) {
    return "Field can't be less than $min";
  }

  if (val.length > max) {
    return "Field be larger than $max";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone number";
    }
  }

  if (type == "link") {
    if (!GetUtils.isURL(val)) {
      return "Not valid link";
    }
  }
}
