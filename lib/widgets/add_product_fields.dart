import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class AddProductFields extends StatelessWidget {
  final int maxLines;
  final String hintText;
  final String text;
  final textInputType;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller;
  final validatorCondition;
  final TextCapitalization textCapitalization;
  final bool mandatory;

  AddProductFields({
    Key? key,
    this.maxLines = 1,
    required this.hintText,
    this.mandatory = true,
    required this.text,
    this.textInputType,
    this.validatorCondition,
    required this.controller,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text + (mandatory ? ' * ' : ''),
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
        TextFormField(
          textCapitalization: textCapitalization,
          controller: controller,
          validator: validatorCondition,
          style: TextStyle(color: Colors.white),
          maxLines: maxLines,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          keyboardType: textInputType,
          onTapOutside: (event) {
            focusNode.unfocus();
          },
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
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }
}
