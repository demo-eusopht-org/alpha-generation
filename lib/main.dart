import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
//
// void main() => runApp(
//   DevicePreview(
//     builder: (context) => const MyApp(),
//   ),
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
