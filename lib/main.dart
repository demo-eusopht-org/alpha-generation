import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noble_vintage/services/local_storage_service.dart';
import 'package:noble_vintage/utils/constants.dart';
import 'package:noble_vintage/views/splash_screen.dart';
import 'package:noble_vintage/widgets/bottom_Navigation.dart';

import 'controller/user_controller.dart';
import 'services/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Constants.backgroundContColor,
    ),
  );
  await Hive.initFlutter();
  await initializeLocator();
  await locator<LocalStorageService>().initializeBox();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final userController = Get.put(UserController());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,
      ),
      child: GetMaterialApp(
        title: 'Alpha Generation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: locator<LocalStorageService>().getData('token') == null
            ? const SplashScreen()
            : MainScreen(),
      ),
    );
  }
}
