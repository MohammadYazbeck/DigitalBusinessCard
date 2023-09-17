import 'package:flutter/cupertino.dart';

class TestingDataModel {
  final ImageProvider<Object>? profileimage;
  final int? userid;
  final int? templatenumber;
  final String? displayname;
  final String? jobtitle;
  final String? about;
  final String? email;
  final String? address;

// Phone Numbers
  final String? phonenumber1;
  final String? phonenumber2;

// Social Media Links
  final String? link1;
  final String? link2;
  final String? link3;
  final String? link4;

  TestingDataModel({
    this.templatenumber,
    this.userid,
    this.profileimage,
    this.displayname,
    this.jobtitle,
    this.about,
    this.email,
    this.address,
    this.phonenumber1,
    this.phonenumber2,
    this.link1,
    this.link2,
    this.link3,
    this.link4,
  });
}
