// import 'package:contacts_service/contacts_service.dart';
import 'package:business_card/core/middleware/models/user.dart';
import 'package:business_card/core/services/app_service.dart';
import 'package:business_card/view/widget/contactlist/viewcards/viewcard1.dart';
import 'package:business_card/view/widget/contactlist/viewcards/viewcard2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/contactlist_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/data/datasource/static/static.dart';
import 'package:business_card/view/widget/contactlist/contactlistminicard.dart';
import 'package:business_card/view/widget/contactlist/viewcards/viewcard.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vcard_maintained/vcard_maintained.dart';
import '../../core/functions/dialog_function.dart';
import '../widget/contactlist/contactlistbottmsheetoption.dart';
import '../widget/contactlist/viewcards/viewcard3.dart';
import '../widget/createcard/createcardtextheader.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});
  @override
  Widget build(BuildContext context) {
    ContactListControllerImp controller = Get.put(ContactListControllerImp());

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0), // here the desired height
          child: AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            title: const CreateCardTextHeader(text: "Contact List"),
          )),
      backgroundColor: AppColor.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                      decoration: BoxDecoration(color: AppColor.primaryColor),
                      width: double.infinity,
                      height: 130,
                      child: Column(
                        children: [
                          ContactListBottomSheetOption(
                              onPressed: () {
                                controller.scanqrcode();
                              },
                              text: "Scan QR Code",
                              icon: Icons.qr_code_scanner),
                          ContactListBottomSheetOption(
                              onPressed: () {
                                controller.readcardvianfc();
                              },
                              text: "Recive Card via NFC",
                              icon: Icons.nfc_outlined),
                        ],
                      ));
                });
            // profileimage: FileImage(File(controller.imagePath))),
//
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(
            Icons.person_add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Obx(
              () => controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 0, left: 0, right: 0),
                      shrinkWrap: true,
                      itemCount: controller.users.value.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (((context, index) {
                        User user = controller.users.value[index];
                        return ContactListMiniCard(
                          view: () {
                            showModalBottomSheet(
                                elevation: 0,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 750,
                                    width: double.infinity,
                                    child: user?.card?.template_id == 0
                                    ? ViewCard(
                                      profileimage: CachedNetworkImageProvider(
                                          user?.card?.profileImage ?? ""),
                                      displayname: user?.card?.name ?? "",
                                      jobtitle: user?.card?.job ?? "",
                                      about: user?.card?.about ?? "",
                                      email: user?.email ?? "",
                                      address: user?.card?.address ?? "",
                                      phonenumber1: user?.card?.phone1 ?? "",
                                      phonenumber2: user?.card?.phone2 ?? "",
                                      link1: user?.card?.facebook ?? "",
                                      link2: user?.card?.instgram ?? "",
                                      link3: user?.card?.linkedin ?? "",
                                      link4: user?.card?.github ?? "",
                                    ) : user?.card?.template_id == 1 ?
                                  ViewCard1(
                                  profileimage: CachedNetworkImageProvider(
                                  user?.card?.profileImage ?? ""),
                                  displayname: user?.card?.name ?? "",
                                  jobtitle: user?.card?.job ?? "",
                                  about: user?.card?.about ?? "",
                                  email: user?.email ?? "",
                                  address: user?.card?.address ?? "",
                                  phonenumber1: user?.card?.phone1 ?? "",
                                  phonenumber2: user?.card?.phone2 ?? "",
                                  link1: user?.card?.facebook ?? "",
                                  link2: user?.card?.instgram ?? "",
                                  link3: user?.card?.linkedin ?? "",
                                  link4: user?.card?.github ?? "",
                                  ) : user?.card?.template_id == 2 ?
                                  ViewCard2(
                                  profileimage: CachedNetworkImageProvider(
                                  user?.card?.profileImage ?? ""),
                                  displayname: user?.card?.name ?? "",
                                  jobtitle: user?.card?.job ?? "",
                                  about: user?.card?.about ?? "",
                                  email: user?.email ?? "",
                                  address: user?.card?.address ?? "",
                                  phonenumber1: user?.card?.phone1 ?? "",
                                  phonenumber2: user?.card?.phone2 ?? "",
                                  link1: user?.card?.facebook ?? "",
                                  link2: user?.card?.instgram ?? "",
                                  link3: user?.card?.linkedin ?? "",
                                  link4: user?.card?.github ?? "",):
                                  user?.card?.template_id == 2 ?
                                  ViewCard3(
                                  profileimage: CachedNetworkImageProvider(
                                  user?.card?.profileImage ?? ""),
                                  displayname: user?.card?.name ?? "",
                                  jobtitle: user?.card?.job ?? "",
                                  about: user?.card?.about ?? "",
                                  email: user?.email ?? "",
                                  address: user?.card?.address ?? "",
                                  phonenumber1: user?.card?.phone1 ?? "",
                                  phonenumber2: user?.card?.phone2 ?? "",
                                  link1: user?.card?.facebook ?? "",
                                  link2: user?.card?.instgram ?? "",
                                  link3: user?.card?.linkedin ?? "",
                                  link4: user?.card?.github ?? "",)
                                  :
                                  ViewCard(
                                  profileimage: CachedNetworkImageProvider(
                                  user?.card?.profileImage ?? ""),
                                  displayname: user?.card?.name ?? "",
                                  jobtitle: user?.card?.job ?? "",
                                  about: user?.card?.about ?? "",
                                  email: user?.email ?? "",
                                  address: user?.card?.address ?? "",
                                  phonenumber1: user?.card?.phone1 ?? "",
                                  phonenumber2: user?.card?.phone2 ?? "",
                                  link1: user?.card?.facebook ?? "",
                                  link2: user?.card?.instgram ?? "",
                                  link3: user?.card?.linkedin ?? "",
                                  link4: user?.card?.github ?? "",));

                                });
                          },
                          save: () async {
                            if (await FlutterContacts.requestPermission()) {
                              var vCard = VCard();
                              vCard.firstName = user?.card?.name ?? "";
                              // vCard.jobTitle = user?.card?.jobtitle!;
                              vCard.workPhone = user?.card?.phone1 ?? "";
                              vCard.note = user?.card?.about ?? "";
                              vCard.email = user?.email ?? "";
                              vCard.socialUrls = {
                                "Facbook": user?.card?.facebook ?? "",
                                "Instagram": user?.card?.instgram ?? "",
                                "Linkedin": user?.card?.linkedin ?? "",
                              };
                              printInfo(info: vCard.getFormattedString());
                              var contact =
                                  Contact.fromVCard(vCard.getFormattedString());
                              printInfo(info: contact.displayName);
                              await contact.insert();
                              dialogFunction(() {
                                Get.back(closeOverlays: true);
                              }, "Return", "Saved",
                                  "The contact has been saved to your Phone Book");
                            }

                            // controller.gotocontactlist();
                          },
                          remove: () async {
                            print('sez');
                            print(user?.id.toString());
                            AppService app = Get.find<AppService>();
                            print(app.token.toString());
                            await controller.removecard(
                              user?.id ?? 5,
                            );
                          },
                          profileimage: user.card?.profileImage ?? "",
                          displayname: user.card?.name ?? "",
                          jobtitle: user.card?.job ?? "",
                          about: user.card?.about ?? "",
                          email: user.email ?? "",
                          address: user.card?.address ?? "",
                          phonenumber1: user.card?.phone1 ?? "",
                          phonenumber2: user.card?.phone2 ?? "",
                          link1: user.card?.facebook ?? "",
                          link2: user.card?.instgram ?? "",
                          link3: user.card?.linkedin ?? "",
                          link4: user.card?.github ?? "",
                        );
                      })),
                    ),
            ),
          )),
        ],
      ),
    );
  }
}
// showModalBottomSheet(
//     isScrollControlled: true,
//     context: context,
//     builder: (context) {
//       return Container(
//           // Check user template so we can choose viewcard1,viewcard2,...
//           height: 700,
//           child: const ViewCard());
//     });
