// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constant/color.dart';
import '../../profile/profiledisplaysectionclick.dart';
import '../../profile/profileimage.dart';
import '../../profile/profileinfodisplaysection.dart';
import '../../profile/profilesoicalmediaicon.dart';
import '../../profile1/profile1displayname.dart';
import '../../profile1/profile1jobtitle.dart';
import '../../profile2/profile2aboutme.dart';

class ViewCard3 extends StatelessWidget {
  final ImageProvider<Object>? profileimage;

  final String displayname;
  final String jobtitle;
  final String about;
  final String email;
  final String address;

// Phone Numbers
  final String phonenumber1;
  final String phonenumber2;

// Social Media Links
  final String link1;
  final String link2;
  final String link3;
  final String link4;

  const ViewCard3(
      {super.key,
      this.profileimage,
      required this.displayname,
      required this.jobtitle,
      required this.about,
      required this.email,
      required this.address,
      required this.phonenumber1,
      required this.phonenumber2,
      required this.link1,
      required this.link2,
      required this.link3,
      required this.link4});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(15)),
        width: MediaQuery.of(context).size.width - 30,
        height: MediaQuery.of(context).size.height - 200,
        child: ListView(
          children: [
            // Profile Container
            Container(
              color: AppColor.white,
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.only(top: 160),
                  child: Center(
                    child: Container(
                      height: 240,
                      width: 320,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Center(
                                child: Profile1DisplayName(
                                    displayname: displayname)),
                          ),
                          const SizedBox(height: 8),
                          Profile1JobTitle(text: jobtitle),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Column(children: [
                      ProfileImage(profileimage: profileimage!),
                    ]),
                  ),
                ),
              ]),
            ),
            // Contacts
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: [
                const SizedBox(height: 20),
                Profile2AboutMeSection(text: about),
                const SizedBox(height: 30),
                ProfileInfoDisplaySectionClick(
                    onTap: () async {
                      await launch('mailto:$email?subject=Subject');
                    },
                    info: email,
                    icondata: Icons.email),
                ProfileInfoDisplaySection(
                    info: address, icondata: Icons.location_city_outlined),
                ProfileInfoDisplaySectionClick(
                    onTap: () async {
                      await launch('tel:$phonenumber1');
                    },
                    info: phonenumber1,
                    icondata: Icons.phone),
                ProfileInfoDisplaySectionClick(
                    onTap: () async {
                      await launch('tel:$phonenumber1');
                    },
                    info: phonenumber2,
                    icondata: Icons.phone),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            var url = link1;
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
                            var url = link2;
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
                            var url = link3;
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
                            var url = link4;
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
