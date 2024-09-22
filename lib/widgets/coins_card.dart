import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';

class CoinsCard extends StatelessWidget {
  final int coins;

  const CoinsCard({
    super.key,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.5),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(17.5),
            ),
            child:
                const Center(child: Icon(CupertinoIcons.money_dollar_circle)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 8),
            child: Text(
              coins.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontFamily: interFont,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
