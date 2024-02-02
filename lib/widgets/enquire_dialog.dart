import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';

class EnquireDialog {
  static showConfirmDialog({
    required String dialogTitle,
    required String label,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      backgroundColor: Constants.backgroundContColor,
      title: dialogTitle,
      titlePadding: EdgeInsets.only(top: 20, left: 10, right: 10),
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 23,
        fontWeight: FontWeight.w700,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      content: SizedBox(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                },
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
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
