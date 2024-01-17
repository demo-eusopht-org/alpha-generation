import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_vintage/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.showPasswordHideButton = false,
    this.validatorCondition,
    required this.hintText,
    required this.controller,
  });

  final bool showPasswordHideButton;
  final String hintText;
  final validatorCondition;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validatorCondition,
      obscureText: isPasswordHidden && widget.showPasswordHideButton,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constants.backgroundContColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constants.backgroundContColor,
          ),
        ),
        focusColor: Constants.backgroundContColor,
        contentPadding: EdgeInsets.only(top: 20),
        isDense: true,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 15,
          // maxWidth: 20,
        ),
        suffixIcon: widget.showPasswordHideButton
            ? IconButton(
                constraints: BoxConstraints(
                  maxHeight: 15,
                  maxWidth: 30,
                ),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  tapTargetSize: MaterialTapTargetSize.padded,
                ),
                icon: Icon(
                  isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                  color: Constants.backgroundContColor,
                  // opticalSize: 1,
                ),
                onPressed: () {
                  isPasswordHidden = !isPasswordHidden;
                  print('HIDDEN: $isPasswordHidden');
                  setState(() {});
                },
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
