import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedElevatedButtonSplash extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;
  final bool loading;

  RoundedElevatedButtonSplash({
    required this.onPressed,
    required this.text,
    this.borderRadius = 20.0,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius), // Rounded corners
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            // vertical: 12.0,
          ),
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            50,
          ),
        ),
        onPressed: onPressed,
        child: loading
            ? SizedBox(
                height: 35,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            : Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ));
  }
}
