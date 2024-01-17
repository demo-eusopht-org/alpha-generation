import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      titlePadding: EdgeInsets.only(top: 20),
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 23,
        fontWeight: FontWeight.w800,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      content: SizedBox(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: Get.width * 0.35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Constants.backgroundContColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                ),
                onPressed: onSecondaryTap,
                child: Text(
                  secondaryLabel,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: Get.width * 0.35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Constants.backgroundContColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                ),
                onPressed: () {
                  onConfirm();
                  Get.back();
                },
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
