import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class ProfileTextFields extends StatelessWidget {
  final int maxLines;
  final String hintText;
  final String text;
  final bool? obscureText;

  const ProfileTextFields({
    Key? key,
    this.maxLines = 1,
    required this.hintText,
    this.obscureText,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText ?? false,
          style: TextStyle(color: Colors.white),
          maxLines: maxLines,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            isDense: true,
            fillColor: Constants.backgroundContColor,
            focusColor: Colors.white,
            filled: true,
            hintText: hintText,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(6),
            ),
            hintStyle: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }
}
