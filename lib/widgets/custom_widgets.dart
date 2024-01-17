import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noble_vintage/utils/constants.dart';

Widget textFormField({
  controller,
  String? hint,
  bool obscureText = false,
  String? prefixText,
  String? Function(String?)? validatorCondition,
  textInputType,
  inputFormat,
  bool? enabled,
}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(12)),
    child: TextFormField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefixText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      obscureText: obscureText,
      validator: validatorCondition,
      keyboardType: textInputType,
      inputFormatters: inputFormat,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    ),
  );
}

Widget textWidget({
  required String text,
  color,
  FontWeight? fWeight,
  fSize,
  align,
}) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
      color: color,
      fontWeight: fWeight,
      fontSize: fSize,
    ),
  );
}

void customToast(String? message) {
  if (message != null) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Constants.backgroundContColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
