import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DefaultWidget extends StatelessWidget {
  final double blueRatio;
  final Widget child;
  final Widget? bottomBar;

  DefaultWidget({
    super.key,
    required this.blueRatio,
    required this.child,
    this.bottomBar,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Constants.backgroundContColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomBar,
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
