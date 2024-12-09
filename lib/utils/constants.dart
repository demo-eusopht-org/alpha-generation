import 'dart:io';

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
  static const String _common =
      'http://alphagenetation.eusopht.com/apis'; //stagging
  static const String baseUrl = "$_common/api/";
  static const String imageUrl = '$_common/product-image/';
  static const String certificateUrl = '$_common/certificate/';
  static final String? clientId = Platform.isAndroid
      ? '885780777429-mam0eif4hodl4k3l6ggo4qv9481fpo57.apps.googleusercontent.com'
      : '885780777429-pclphg7jtf5b4ecr9fh2qrqlr2ia0mj6.apps.googleusercontent.com';
}
