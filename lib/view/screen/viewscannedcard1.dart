// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/viewscannedcard_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/contactlist/viewcardbutton.dart';
import '../widget/profile/profiledisplaysectionclick.dart';
import '../widget/profile/profileimage.dart';
import '../widget/profile/profileinfodisplaysection.dart';
import '../widget/profile/profilesoicalmediaicon.dart';
import '../widget/profile1/profile1abouteme.dart';
import '../widget/profile1/profile1displayname.dart';
import '../widget/profile1/profile1jobtitle.dart';

class ViewScannedCard1 extends StatelessWidget {
  const ViewScannedCard1({super.key});
  @override
  Widget build(BuildContext context) {
    ViewScannedCardControllerImp controller =
        Get.put(ViewScannedCardControllerImp());

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height - 190,
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColor.primaryColor,
                    child: Container(
                      color: const Color.fromARGB(255, 239, 239, 239),
                      child: Stack(children: [
                        ClipPath(
                          clipper: DiagonalPathClipperTwo(),
                          child: Container(
                            height: 230,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: AppColor.primaryColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              left: 20, top: 45),
                                          child: Profile1DisplayName(
                                              displayname:
                                                  controller.card.name ??"")),
                                    ]),
                                const SizedBox(height: 20),
                                Container(
                                    margin: const EdgeInsets.only(left: 25),
                                    child: Profile1JobTitle(
                                        text: controller.card.job ??"")),
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
                              child: Profile1AboutMeSection(
                                  text: controller.card.about?? "")),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width - 270,
                            top: 110,
                          ),
                          child: Column(children: [
                            ProfileImage(
                                profileimage: CachedNetworkImageProvider(
                                    controller.card.profileImage ?? "")),
                          ]),
                        ),
                      ]),
                    ),
                  ),

                  // profileimage: FileImage(File(controller.imagePath))),

                  // Contacts
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(children: [
                      const SizedBox(height: 35),
                      ProfileInfoDisplaySectionClick(
                          onTap: () {
                            controller.launchemail();
                          },
                          info: controller.card.email??"",
                          icondata: Icons.email),
                      ProfileInfoDisplaySection(
                          info: controller.card.address ?? "",
                          icondata: Icons.location_city_outlined),
                      ProfileInfoDisplaySectionClick(
                          onTap: () {
                            controller.launchphonenumber(1);
                          },
                          info: controller.card.phone1 ??"",
                          icondata: Icons.phone),
                      ProfileInfoDisplaySectionClick(
                          onTap: () {
                            controller.launchphonenumber(2);
                          },
                          info: controller.card.phone2 ??"",
                          icondata: Icons.phone),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
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
                              var url = controller.card.facebook ??"";
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
                              var url = controller.card.instgram ??"";
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
                              var url = controller.card.instgram ??"";
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
                              var url = controller.card.github ??"";
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: ViewCardButton(
                onPressed: () {
                  controller.addToContactList();
                },
                text: "Add to contact list",
                textcolor: AppColor.primaryColor,
                buttoncolor: AppColor.white),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: ViewCardButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.home);
                },
                text: "Dissmis",
                textcolor: AppColor.primaryColor,
                buttoncolor: const Color.fromARGB(255, 85, 74, 73)),
          )
        ],
      ),
    );
  }
}
