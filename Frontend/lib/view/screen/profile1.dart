// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:business_card/controller/profile_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/view/widget/profile/profilediaglogtextfield.dart';
import 'package:business_card/view/widget/profile/profiledialogbutton.dart';
import 'package:business_card/view/widget/profile/profileinfodisplaysection.dart';
import 'package:business_card/view/widget/profile/profilesoicalmediaicon.dart';
import 'package:business_card/view/widget/profile1/profile1abouteme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/functions/validinput.dart';
import '../widget/profile/profilebottomsheetshareoption.dart';
import '../widget/profile/profileimage.dart';
import '../widget/profile1/profile1displayname.dart';
import '../widget/profile1/profile1jobtitle.dart';
import '../widget/profile1/profile1normaliconbutton.dart';

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30.0), // here the desired height
          child: AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
          )),
      backgroundColor: AppColor.primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: FloatingActionButton(
                heroTag: "float1",
                onPressed: () {
                  controller.logout();
                },
                backgroundColor: AppColor.primaryColor,
                child: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.white,
                ),
              )),
          Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                heroTag: "float2",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            decoration:
                                BoxDecoration(color: AppColor.primaryColor),
                            width: double.infinity,
                            height: 190,
                            child: Column(
                              children: [
                                // ProfileBottomSheetShareOption(
                                //     onPressed: () {
                                //       controller.shareviawallet();
                                //     },
                                //     text: "Share via Mobile Wallet",
                                //     icon: Icons.wallet),
                                ProfileBottomSheetShareOption(
                                    onPressed: () {
                                      // controller.shareviaqr();

                                      Get.defaultDialog(
                                        title: "Scan the QR Code",
                                        titlePadding: const EdgeInsets.only(
                                            top: 25, bottom: 15),
                                        titleStyle: TextStyle(
                                            fontSize: 21,
                                            color: AppColor.darkgrey,
                                            fontWeight: FontWeight.w600),
                                        content: BarcodeWidget(
                                          padding: const EdgeInsets.all(15),
                                          data: "${controller.cardId}",
                                          // data: controller.dsisplayname,
                                          barcode: Barcode.qrCode(),
                                          height: 200,
                                          width: 200,
                                          color: AppColor.primaryColor,
                                        ),
                                        contentPadding:
                                        const EdgeInsets.all(25),
                                      );
                                    },
                                    text: "Share via QR Code",
                                    icon: Icons.qr_code),
                                ProfileBottomSheetShareOption(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title:
                                              "Please insert the target email",
                                          titlePadding: const EdgeInsets.only(
                                              top: 25, bottom: 20),
                                          titleStyle: TextStyle(
                                              fontSize: 19,
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.w600),
                                          content: SizedBox(
                                            width: 300,
                                            height: 200,
                                            child: Form(
                                              key: controller.formstate,
                                              child: Column(
                                                children: [
                                                  ProfileDialogTextField(
                                                      valid: (val) {
                                                        return validInput(val!,
                                                            8, 50, "email");
                                                      },
                                                      labeltext: "Email",
                                                      mycontroller: controller
                                                          .targetemail,
                                                      icondata: Icons.email),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  ProfileDialogbutton(
                                                    text: "Share",
                                                    onPressed: () {
                                                      controller
                                                          .shareviaemail();
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(30));
                                    },
                                    text: "Share via Email",
                                    icon: Icons.email),
                                ProfileBottomSheetShareOption(
                                    onPressed: () {
                                      controller.sharevianfc();
                                    },
                                    text: "Share via NFC",
                                    icon: Icons.nfc),
                              ],
                            ));
                      });
                },
                backgroundColor: AppColor.primaryColor,
                child: const Icon(
                  Icons.share_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          // Profile Container
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Container(
              color: const Color.fromARGB(255, 239, 239, 239),
              child: Stack(children: [
                ClipPath(
                  clipper: DiagonalPathClipperTwo(),
                  child: Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColor.primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  margin:
                                      const EdgeInsets.only(left: 20, top: 45),
                                  child: Profile1DisplayName(
                                      displayname: controller.displayname)),
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: Profile1NormalIconButton(
                                    icon: Icons.mode_edit_outlined,
                                    iconsize: 24,
                                    onPressed: () {
                                      controller.editprofile();
                                    }),
                              )
                            ]),
                        const SizedBox(height: 20),
                        Container(
                            margin: const EdgeInsets.only(left: 25),
                            child: Profile1JobTitle(text: controller.jobtitle)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 230, bottom: 50),
                  width: double.infinity,
                  color: const Color.fromARGB(255, 239, 239, 239),
                  child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Profile1AboutMeSection(text: controller.about)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width - 192,
                    top: 110,
                  ),
                  child: Column(children: [
                    Obx(() => ProfileImage(
                profileimage: controller.myCard.value.profileImage != null
                ? CachedNetworkImageProvider(controller
                    .myCard.value.profileImage!)
            : FileImage(File(controller.myServices.sharedPreferences.getString("dimage") ?? ""))
    as ImageProvider

    ))
                  ]),
                ),
              ]),
            ),
          ),

          // Contacts
          Container(
            color: AppColor.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              ProfileInfoDisplaySection(
                  info: controller.email, icondata: Icons.email),
              ProfileInfoDisplaySection(
                  info: controller.address,
                  icondata: Icons.location_city_outlined),
              ProfileInfoDisplaySection(
                  info: controller.phonenumber1, icondata: Icons.phone),
              ProfileInfoDisplaySection(
                  info: controller.phonenumber2, icondata: Icons.phone),
              const SizedBox(height: 40),
              // Social media links
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColor.primarytransColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileSocialMediaIcon(
                        color: AppColor.black54,
                        onPressed: () async {
                          // ignore: prefer_interpolation_to_compose_strings
                          var url = controller.link1;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        socialmediaicon: FontAwesomeIcons.facebook),
                    ProfileSocialMediaIcon(
                        color: AppColor.black54,
                        onPressed: () async {
                          // ignore: prefer_interpolation_to_compose_strings
                          var url = controller.link2;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        socialmediaicon: FontAwesomeIcons.instagram),
                    ProfileSocialMediaIcon(
                        color: AppColor.black54,
                        onPressed: () async {
                          // ignore: prefer_interpolation_to_compose_strings
                          var url = controller.link3;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        socialmediaicon: FontAwesomeIcons.linkedin),
                    ProfileSocialMediaIcon(
                        color: AppColor.black54,
                        onPressed: () async {
                          // ignore: prefer_interpolation_to_compose_strings
                          var url = controller.link4;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        socialmediaicon: FontAwesomeIcons.github),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
