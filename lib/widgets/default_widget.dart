import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class DefaultWidget extends StatelessWidget {
  final double blueRatio;
  final Widget child;
  final Widget? bottomBar;
  final bool showBackIcon;
  final String? heading;

  DefaultWidget({
    super.key,
    required this.blueRatio,
    required this.child,
    required this.showBackIcon,
    this.heading,
    this.bottomBar,
  });
  @override
  Widget build(BuildContext context) {
    final shouldShowAppBar = heading != null && showBackIcon;
    return Scaffold(
      backgroundColor: Constants.backgroundContColor,
      // resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomBar,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: shouldShowAppBar
          ? AppBar(
              elevation: 0.0,
              title: Text(
                heading!,
                style: GoogleFonts.inter(
                  color: Constants.splashTextColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: showBackIcon
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25,
                      ),
                      // Image.asset(
                      //   'assets/images/back_arrow.png',
                      // ),
                    )
                  : null,
            )
          : null,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Constants.backgroundContColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                blueRatio,
                blueRatio,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
