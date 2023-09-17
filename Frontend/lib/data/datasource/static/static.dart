// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:business_card/core/constant/imageasset.dart';
import 'package:business_card/data/model/onboardingmodel.dart';
import 'package:business_card/data/model/templatemodel.dart';
import 'package:business_card/data/model/testingdatamodel.dart';
import 'package:business_card/data/model/welcomemodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Create Your Card",
      body: "Create your own buisness card easly, by adding your information",
      image: AppImageAsset.onBooardingImageOne),
  OnBoardingModel(
      title: "Share Your Card",
      body:
          "Share your own Buisness card, using email, mobile wallet and QR code",
      image: AppImageAsset.onBooardingImageTwo),
  OnBoardingModel(
      title: "NFC Services",
      body: "Scan or drop, share your card or add one to your list using NFC",
      image: AppImageAsset.onBooardingImageThree),
  OnBoardingModel(
      title: "Contact List",
      body:
          "Manage your contact by adding/removing cards from your contact list.",
      image: AppImageAsset.onBooardingImageFour)
];

WelcomeModel welcome = WelcomeModel(
    title: "Welcome",
    body: "Digital business card, the best way to introduce yourself, Join us!",
    image: AppImageAsset.welcome);

List<TemplateModel> templatelist = [
  TemplateModel(image: AppImageAsset.template0),
  TemplateModel(image: AppImageAsset.template1),
  TemplateModel(image: AppImageAsset.template2),
  TemplateModel(image: AppImageAsset.template3),
];

List<TestingDataModel> testingdatalist = [
  TestingDataModel(
    templatenumber: 1,
    userid: 2,
    displayname: "MohammadYazbeck",
    jobtitle: "Software eng.",
    about: "born in 27/8/1999, works for khara company",
    email: "mohamyazbec@gmail.com",
    address: "Damascus,Syria",
    phonenumber1: "09323232323",
    phonenumber2: "0231231232",
    link1: "facebook.com",
    link2: "facegsddsad.com",
    link3: "dasdasdasdas.com",
    link4: "Asdasdasd.com",
    profileimage: const AssetImage(AppImageAsset.profileimage),
  ),
  TestingDataModel(
    templatenumber: 2,
    userid: 1,
    displayname: "Samer",
    jobtitle: "Software eng.",
    about: "born in 27/8/1999, works for khara company",
    email: "mohamyazbec@gmail.com",
    address: "Damascus,Syria",
    phonenumber1: "09323232323",
    phonenumber2: "0231231232",
    link1: "facebook.com",
    link2: "facegsddsad.com",
    link3: "dasdasdasdas.com",
    link4: "Asdasdasd.com",
    profileimage: const AssetImage(AppImageAsset.profileimage),
  ),
  TestingDataModel(
    templatenumber: 3,
    userid: 3,
    displayname: "waleed",
    jobtitle: "Software eng.",
    about: "born in 27/8/1999, works for khara company",
    email: "waleed@gmail.com",
    address: "Damascus,Syria",
    phonenumber1: "09323232323",
    phonenumber2: "0231231232",
    link1: "facebook.com",
    link2: "facegsddsad.com",
    link3: "dasdasdasdas.com",
    link4: "Asdasdasd.com",
    profileimage: const AssetImage(AppImageAsset.profileimage),
  ),
];
