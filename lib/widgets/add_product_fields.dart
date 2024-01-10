import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class AddProductFields extends StatelessWidget {
  final int maxLines;
  final String hintText;
  final String text;

  const AddProductFields(
      {Key? key, this.maxLines = 1, required this.hintText, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          maxLines: maxLines,
          textInputAction: TextInputAction.next,
          onTapOutside: (event) {},
          decoration: InputDecoration(
            isDense: true,
            fillColor: Constants.backgroundContColor,
            filled: true,
            hintText: hintText,
            suffixIconConstraints: BoxConstraints(
              maxHeight: 10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            hintStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
