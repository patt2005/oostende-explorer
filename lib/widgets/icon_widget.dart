import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "oostende",
          style: TextStyle(
            height: 0.7,
            fontFamily: montserratFont,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        Text(
          "explorer app",
          style: TextStyle(
            fontFamily: montserratFont,
            fontWeight: FontWeight.w300,
            fontSize: 21,
          ),
        ),
      ],
    );
  }
}
