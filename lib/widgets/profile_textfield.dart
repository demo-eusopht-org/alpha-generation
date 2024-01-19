import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class ProfileTextFields extends StatelessWidget {
  final int maxLines;
  final textInputType;
  final String hintText;
  final String text;
  final bool? obscureText;
  final TextEditingController controller;
  final bool? enabled;
  final validatorCondition;

  const ProfileTextFields({
    Key? key,
    this.maxLines = 1,
    required this.hintText,
    this.textInputType,
    this.enabled,
    this.obscureText,
    required this.text,
    required this.controller,
    this.validatorCondition,
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
        TextFormField(
          enabled: enabled,
          controller: controller,
          validator: validatorCondition,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
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
