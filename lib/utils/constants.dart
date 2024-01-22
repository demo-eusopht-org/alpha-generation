import 'package:flutter/material.dart';

class Constants {
  static Color splashScreenBackgroundColor = Color(0xff142F5A);
  static Color splashTextColor = Color(0xffBF9B30);
  static Color loginBackground = Color(0xffDDDDDD);
  static Color loginButtonColor = Color(0xff1D2E5A);
  static Color backgroundContColor = Color(0xff1D2E5A);
  static Color showDateContColor = Color(0xffA9D9D9);
  // static const String baseUrl = "http://192.168.100.84:3000/api/";
  // static const String _common = 'http://192.168.100.39:3000'; //local
  static const String _common = 'http://34.223.102.186/apis'; //stagging
  static const String baseUrl = "$_common/api/";
  static const String imageUrl = '$_common/product-image/';
  static const String certificateUrl = '$_common/certificate/';
}
