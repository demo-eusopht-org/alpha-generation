import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noble_vintage/utils/constants.dart';

class AppDialogs {
  static showConfirmDialog({
    required String dialogTitle,
    required String label,
    required String secondaryLabel,
    required VoidCallback onConfirm,
    required VoidCallback onSecondaryTap,
  }) {
    Get.defaultDialog(
      backgroundColor: Constants.backgroundContColor,
      title: dialogTitle,
      titlePadding: EdgeInsets.only(top: 10),
      titleStyle: TextStyle(color: Colors.white),
      content: SizedBox(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: onSecondaryTap,
              child: Text(secondaryLabel),
            ),
            ElevatedButton(
              onPressed: () {
                onConfirm();
                Get.back();
              },
              child: Text(label),
            ),
          ],
        )
      ],
    );
  }
}
