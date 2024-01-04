import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              decorationColor: Colors.white,
              decorationThickness: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
