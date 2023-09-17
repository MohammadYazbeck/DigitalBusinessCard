// ignore_for_file: prefer_const_constructors
import 'package:business_card/view/screen/viewscannedcard1.dart';
import 'package:business_card/view/screen/viewscannedcard2.dart';
import 'package:business_card/view/screen/viewscannedcard3.dart';
import 'package:get/get.dart';
import 'package:business_card/core/constant/routes.dart';
import 'package:business_card/core/middleware/middleware.dart';
import 'package:business_card/view/screen/contactlist.dart';
import 'package:business_card/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:business_card/view/screen/auth/login.dart';
import 'package:business_card/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:business_card/view/screen/auth/forgetpassword/succsess_resetpassword.dart';
import 'package:business_card/view/screen/auth/succsess_signup.dart';
import 'package:business_card/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:business_card/view/screen/auth/verifycodesignup.dart';
import 'package:business_card/view/screen/createcard.dart';
import 'package:business_card/view/screen/home.dart';
import 'package:business_card/view/screen/onboarding.dart';
import 'package:business_card/view/screen/profile.dart';
import 'package:business_card/view/screen/scanqrcode.dart';
import 'package:business_card/view/screen/viewscannedcard.dart';
import 'package:business_card/view/screen/welcome.dart';
import 'package:business_card/view/screen/auth/signup.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => OnBoarding(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(name: AppRoute.login, page: () => LoginPage()),
  GetPage(name: AppRoute.welcome, page: () => Welcome()),
  GetPage(name: AppRoute.signup, page: () => SignupPage()),
  GetPage(name: AppRoute.createcard, page: () => CreateCard()),
  GetPage(name: AppRoute.profile, page: () => ProfilePage()),
  GetPage(name: AppRoute.forgetpassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => VerifyCode()),
  GetPage(name: AppRoute.resetpassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoute.succsessresetpassword,
      page: () => SuccsessResetPassword()),
  GetPage(name: AppRoute.succsesssignup, page: () => SuccsessSignup()),
  GetPage(name: AppRoute.verifycodesignup, page: () => VerifyCodeSignUp()),
  GetPage(name: AppRoute.contactlist, page: () => ContactList()),
  GetPage(name: AppRoute.home, page: () => HomePage()),
  GetPage(name: AppRoute.viewscannedcard, page: () => ViewScannedCard()),
  GetPage(name: AppRoute.viewscannedcard1, page: () => ViewScannedCard1()),
  GetPage(name: AppRoute.viewscannedcard2, page: () => ViewScannedCard2()),
  GetPage(name: AppRoute.viewscannedcard3, page: () => ViewScannedCard3()),

  GetPage(name: AppRoute.scanqrcode, page: () => ScanQrCode()),
];
