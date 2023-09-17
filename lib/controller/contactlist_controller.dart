import 'dart:async';
import 'dart:developer';

import 'package:business_card/core/functions/choosescannedcard.dart';
import 'package:business_card/core/functions/dialog_function.dart';
import 'package:business_card/core/functions/show_error.dart';
import 'package:business_card/core/middleware/models/card.dart';
import 'package:business_card/core/middleware/models/user.dart';
import 'package:business_card/core/repositries/back_end_repo.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/services/services.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class ContactListController extends GetxController {
  scanqrcode();
  readcardvianfc();
  removecard(int contactId);
  localPath();
  loadCards();
}

class ContactListControllerImp extends ContactListController {
  MyServices myServices = Get.find();
  RxList<User> users = RxList<User>([]);
  RxBool loading = RxBool(true);
  BackEndRepo _backEndRepo = Get.find<BackEndRepo>();
  bool supportsNFC = false;
  StreamSubscription<NDEFMessage>? stream;
  BackEndRepo backEndRepo = Get.find<BackEndRepo>();
  String? path;
  @override
  void onInit() {
    loadCards();
    super.onInit();
  }

  @override
  removecard(int contactId) async {
    await backEndRepo.removeMyContact(contactId);
    loadCards();
    users.removeWhere((element) => element.id==contactId);

  }

  @override
  readcardvianfc() async {
    await NFC.isNDEFSupported.then((bool isSupported) {
      supportsNFC = isSupported;
    });
    if (supportsNFC) {
      stream = NFC
          .readNDEF(once: false, readerMode: NFCDispatchReaderMode())
          .listen((NDEFMessage message) {
        dialogFunction(() async {
          await stream?.cancel();
          stream = null;
          var response = await _backEndRepo.getCard(int.parse(message.data));
          log(response.toString());
          Card card = Card.fromJson(response['card']);
          log(card.job.toString(), name: "card");

          Get.toNamed(choosescannedcard(card?.template_id ?? 0 ), arguments: card);
        }, "View Card", "Card ID Scanned!", "Card ID: ${message.data}");
      });

    } else {
      showError("Your Device does not support NFC Services");
    }
  }

  @override
  scanqrcode() {
    Get.offAllNamed(AppRoute.scanqrcode);
  }

  @override
  localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    path = directory.path;
  }

  @override
  loadCards() async {
    var response = await backEndRepo.getContacts();
    log(response.toString(), name: "llo");
    var data = response['data'];
    if (data.isNotEmpty) {
      List<User>? myUsers = data != null
          ? List<User>.of(
              response?['data'].map<User>((res) => User.fromJson(res)))
          : [];
      users(myUsers);
    }

    // log(users.first?.card?.name.toString() ??"l",name: "f");
    loading(false);
  }
}
