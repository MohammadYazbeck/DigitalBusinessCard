// ignore_for_file: unnecessary_cast, unnecessary_null_comparison

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_card/controller/createcard_controller.dart';
import 'package:business_card/core/constant/color.dart';
import 'package:business_card/core/functions/validinput.dart';
import 'package:business_card/data/datasource/static/static.dart';
import 'package:business_card/view/widget/createcard/createcardbottomsheet.dart';
import 'package:business_card/view/widget/createcard/createcardbutton.dart';
import 'package:business_card/view/widget/createcard/createcardtextfield.dart';
import 'package:business_card/view/widget/createcard/createcardtextheader.dart';
import 'package:business_card/view/widget/createcard/createcardtitle.dart';
import 'package:business_card/view/widget/createcard/uploadimage.dart';

import '../widget/createcard/createcardcolor.dart';

class CreateCard extends StatelessWidget {
  const CreateCard({super.key});
  @override
  Widget build(BuildContext context) {
    CreateCardContollerImp controller = Get.put(CreateCardContollerImp());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0), // here the desired height
          child: AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            title: const CreateCardTextHeader(text: "Personal Card"),
          )),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                // ignore: sized_box_for_whitespace
                child: Form(
                  key: controller.formstate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    // margin: const EdgeInsets.only(bottom: 50),
                    // width: MediaQuery.of(context).size.width - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const CreateCardTitle(text: "Profile Info"),
                        Column(
                          children: <Widget>[
                            GetBuilder<CreateCardContollerImp>(
                              builder: (controller) => UploadImage(
                                  ontap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return CreateCardBottomSheet(
                                              uploadImageGallery: () {
                                            controller.uploadImageGallery();
                                          }, uploadImageCamera: () {
                                            controller.uploadImageCamera();
                                          });
                                        });
                                  },
                                  image: controller.image != null
                                      ? FileImage(controller.image as File)
                                          as ImageProvider
                                      : CachedNetworkImageProvider(controller.card?.profileImage ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
                            ),),
                            const SizedBox(
                              height: 45,
                            ),
                            CreateCardTextField(
                                valid: (val) {
                                  return validInput(val!, 3, 25, "displayname");
                                },
                                mycontroller: controller.displayname,
                                labeltext: "Display name",
                                icondata: Icons.person),
                            CreateCardTextField(
                                valid: (val) {
                                  return validInput(val!, 5, 20, "jobtitle");
                                },
                                mycontroller: controller.jobtitle,
                                labeltext: "Job title",
                                icondata: Icons.work_outline_rounded),
                            CreateCardTextField(
                              valid: (val) {
                                return validInput(val!, 10, 150, "about");
                              },
                              mycontroller: controller.about,
                              labeltext: "About",
                              icondata: Icons.info_outline_rounded,
                            ),
                            CreateCardTextField(
                                valid: (val) {
                                  return validInput(val!, 8, 60, "email");
                                },
                                mycontroller: controller.email,
                                labeltext: "Email",
                                icondata: Icons.email),
                            CreateCardTextField(
                                valid: (val) {
                                  return validInput(val!, 8, 30, "address");
                                },
                                mycontroller: controller.address,
                                labeltext: "Address",
                                icondata: Icons.location_on_rounded),
                          ],
                        ),
                        const CreateCardTitle(text: "Phone Numbers"),
                        Column(children: [
                          CreateCardTextField(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 8, 25, "phone");
                            },
                            mycontroller: controller.phonenumber1,
                            labeltext: "Phone number 1:",
                            icondata: Icons.phone_android,
                          ),
                          CreateCardTextField(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 8, 25, "phone");
                            },
                            mycontroller: controller.phonenumber2,
                            labeltext: "Phone number 2:",
                            icondata: Icons.phone_android,
                          ),
                        ]),
                        const CreateCardTitle(text: "Social Media Links"),
                        Column(children: [
                          CreateCardTextField(
                            valid: (val) {
                              return validInput(val!, 10, 50, "link");
                            },
                            mycontroller: controller.facebook,
                            labeltext: "Facebook:",
                            icondata: Icons.link,
                          ),
                          CreateCardTextField(
                            valid: (val) {
                              return validInput(val!, 10, 50, "link");
                            },
                            mycontroller: controller.instagram,
                            labeltext: "Instagram",
                            icondata: Icons.link,
                          ),
                          CreateCardTextField(
                            valid: (val) {
                              return validInput(val!, 10, 50, "link");
                            },
                            mycontroller: controller.linkedin,
                            labeltext: "Linkedin",
                            icondata: Icons.link,
                          ),
                          CreateCardTextField(
                            valid: (val) {
                              return validInput(val!, 10, 50, "link");
                            },
                            mycontroller: controller.github,
                            labeltext: "Github",
                            icondata: Icons.link,
                          ),
                        ]),
                        const SizedBox(
                          height: 30,
                        ),
                        const CreateCardTitle(text: "App Color"),
                        GetBuilder<CreateCardContollerImp>(
                          builder: (controller) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CreateCardColor(
                                  colorid: 0,
                                  onTap: () {
                                    controller.changeappcolor(0);
                                  },
                                  color:
                                      const Color.fromARGB(255, 150, 202, 255)),
                              CreateCardColor(
                                  colorid: 1,
                                  onTap: () {
                                    controller.changeappcolor(1);
                                  },
                                  color:
                                      const Color.fromARGB(255, 255, 150, 150)),
                              CreateCardColor(
                                  colorid: 2,
                                  onTap: () {
                                    controller.changeappcolor(2);
                                  },
                                  color:
                                      const Color.fromARGB(255, 202, 150, 255)),
                              CreateCardColor(
                                  colorid: 3,
                                  onTap: () {
                                    controller.changeappcolor(3);
                                  },
                                  color:
                                      const Color.fromARGB(255, 109, 186, 151)),

                              // CreateCardColor(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CreateCardButton(
                          textcolor: AppColor.primaryColor,
                          buttoncolor: const Color.fromARGB(255, 212, 212, 212),
                          text: "Change Template",
                          onPressed: () {
                            Get.defaultDialog(
                                title: "Choose a template",
                                titlePadding:
                                    const EdgeInsets.only(top: 25, bottom: 10),
                                titleStyle: TextStyle(
                                    fontSize: 24,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500),
                                content: SizedBox(
                                  height: 400,
                                  width: 400,
                                  child: ListView.builder(
                                      itemCount: 4,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, index) {
                                        return InkWell(
                                          onTap: () {
                                            controller.updatetemplate(index);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            height: 350,
                                            width: 260,
                                            child: Image.asset(
                                                templatelist[index].image!),
                                          ),
                                        );
                                      })),
                                ),
                                contentPadding: const EdgeInsets.all(10));
                          },
                        ),
                        CreateCardButton(
                            textcolor: AppColor.white,
                            buttoncolor: AppColor.primaryColor,
                            text: "Save Information",
                            onPressed: () {
                              controller.createCard();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
