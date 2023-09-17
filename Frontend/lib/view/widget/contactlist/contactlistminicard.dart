import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/view/widget/contactlist/contactlistbottmsheetoption.dart';

class ContactListMiniCard extends StatelessWidget {
  final String? profileimage;
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

  final void Function()? remove;
  final void Function()? view;
  final void Function()? save;

  const ContactListMiniCard({
    super.key,
    required this.profileimage,
    required this.displayname,
    required this.jobtitle,
    this.remove,
    this.view,
    this.save,
    required this.about,
    required this.email,
    required this.address,
    required this.phonenumber1,
    required this.phonenumber2,
    required this.link1,
    required this.link2,
    required this.link3,
    required this.link4,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                  decoration: BoxDecoration(color: AppColor.primaryColor),
                  width: double.infinity,
                  height: 190,
                  child: Column(
                    children: [
                      ContactListBottomSheetOption(
                          onPressed: remove,
                          text: "Remove Card",
                          icon: Icons.remove_circle_outline),
                      ContactListBottomSheetOption(
                          onPressed: view,
                          text: "View Card",
                          icon: Icons.person),
                      ContactListBottomSheetOption(
                          onPressed: save,
                          text: "Save as VCF",
                          icon: Icons.save),
                    ],
                  ));
            });
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColor.textfieldprimary))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  profileimage??""
              ),
              radius: 35,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayname,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    jobtitle,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.darkgrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
