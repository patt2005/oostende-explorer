import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/main.dart';
import 'package:oostende_explorer_app/models/location.dart';
import 'package:oostende_explorer_app/utilities/colors.dart';
import 'package:oostende_explorer_app/utilities/font_names.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationCard extends StatefulWidget {
  final Location locatoinInfo;

  const LocationCard({
    super.key,
    required this.locatoinInfo,
  });

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              widget.locatoinInfo.imageAssetPath,
              width: double.infinity,
              height: deviceSize.height * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.locatoinInfo.title,
                        style: const TextStyle(
                          fontFamily: interFont,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Icon(
                            _isFavorite
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Spacer(),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(0),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        backgroundColor: WidgetStatePropertyAll(kCardColor),
                      ),
                      onPressed: () async {
                        await launchUrl(
                            Uri.parse(widget.locatoinInfo.mapLocationUrl));
                      },
                      child: const Text(
                        "Visit now",
                        style: TextStyle(
                          fontFamily: interFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: const WidgetStatePropertyAll(0),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        backgroundColor:
                            WidgetStatePropertyAll(kBackgroundColor),
                      ),
                      onPressed: () async {
                        await launchUrl(
                            Uri.parse(widget.locatoinInfo.informationUrl));
                      },
                      child: const Text(
                        "Information",
                        style: TextStyle(
                          fontFamily: interFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
